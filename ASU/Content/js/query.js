/** Polyfills */
var isOldBrowser = false

if (!Array.prototype.indexOf) {
	isOldBrowser = true
	Array.prototype.indexOf = function (elt /*, from*/) {
		var len = this.length >>> 0;

		var from = Number(arguments[1]) || 0;
		from = (from < 0)
			? Math.ceil(from)
			: Math.floor(from);
		if (from < 0)
			from += len;

		for (; from < len; from++) {
			if (from in this &&
				this[from] === elt)
				return from;
		}
		return -1;
	};
}

if (!Array.prototype.filter) {
	isOldBrowser = true
	Array.prototype.filter = function (lambda) {

		var arr = []

		for (var i = 0; i < this.length; i++) {
			if (lambda.call(this, this[i], i)) arr.push(this[i])
		}

		return arr
	}
}

if (!Element.prototype.closest) {
	isOldBrowser = true
	Element.prototype.closest = function closest(selector) {
		var node = this;

		while (node) {
			if (node.parentNode.querySelector(selector)) return node;
			else node.parentNode;
		}

		return null;
	};
}

if (!String.prototype.trim) {
	isOldBrowser = true
	String.prototype.trim = function () {
		return this.replace(/^\s+|\s+$/g, '');
	};
}


/** Массив параметров */
var Hash = {}

window.onload = function () {
	if (location.hash == '') {
		hashSet('s', document.getElementById('controls-date-start').value + ' ' + document.getElementById('controls-time-start').value)
		hashSet('e', document.getElementById('controls-date-end').value + ' ' + document.getElementById('controls-time-end').value)
		document.getElementById('server').value = cookie('server') || 'insql2'
	}
	hashRestore()
}
window.onhashchange = hashRestore

/** Получение массива параметров из хэша */
function hashRestore() {
	hashReset()
	var arr = decodeURIComponent(location.hash)
		.replace('#', '')
		.split('|')

	for (var i = 0; i < arr.length; i++) {
		if (arr[i] != '') {
			var parts = arr[i].split('=')
			var key = parts[0], value = parts[1]
			if (isArray(Hash[key])) {
				Hash[key] = value.split(';');
			} else {
				Hash[key] = value;
			}
		}
	}

	hashNavigate()
}

/** Сброс массива параметров */
function hashReset() {
	Hash = {
		q: '', // поисковый запрос
		v: '', // тип тегов

		t: [], // список тегов
		c: '', // цикличность
		s: '', // дата начала
		e: '',  // дата конца

		server: cookie('server') || 'insql2',
		mode: 'table'
	}
}

/**
 * Установка нового значения для параметра в хэш-строке
 * @param {string} key
 * @param {string} value
 */
function hashSet(key, value, noReload) {
	console.log('set hash')
	if (isArray(Hash[key])) {
		console.log(key, '= array')
		var i = Hash[key].indexOf(value)
		if (i < 0) Hash[key].push(value)
		else Hash[key] = Hash[key].filter(x => x != value)
		Hash[key] = Hash[key].filter(x => x != '')
	} else {
		console.log(key, '= value')
		Hash[key] = value
	}

	var hash = []
	for (var key in Hash) {
		if (isArray(Hash[key])) {
			if (Hash[key].length > 0) hash.push(key + '=' + Hash[key].join(';'))
		} else {
			if (Hash[key] != '') hash.push(key + '=' + Hash[key])
		}
		
	}
	if (!noReload) location.hash = hash.join('|')
}

/** Выполнение действий с сервером исходя из параметров */
function hashNavigate() {

	// область найденных тегов
	document.getElementById('tags-search-input').value = decodeURIComponent(Hash['q'])
	document.getElementById('tags-search-type').value = Hash['v']
	post(host + 'pages/query/tags.aspx', Hash, function (text) {
		document.getElementById('tags-search-results').innerHTML = text
	})

	// область выбранных тегов
	document.getElementById('tags-selected-header').innerHTML = 'Выбрано тегов: ' + Hash['t'].length
	post(host + 'pages/query/selectedTags.aspx', Hash, function (text) {
		document.getElementById('tags-selected').innerHTML = text
	})

	// область контролов
	document.getElementById('controls-cycle').value = Hash['c']
	var dt = decodeURIComponent(Hash['s']).split(' ')
	if (dt.length > 1) {
		document.getElementById('controls-date-start').value = dt[0]
		document.getElementById('controls-time-start').value = dt[1]
	}
	dt = decodeURIComponent(Hash['e']).split(' ')
	if (dt.length > 1) {
		document.getElementById('controls-date-end').value = dt[0]
		document.getElementById('controls-time-end').value = dt[1]
	}

	var el = document.querySelector('button.active')
	if (el) removeClass(el, 'active')
	el = document.querySelector('[mode="' + Hash.mode + '"]')
	if (el) addClass(el, 'active')

	document.getElementById('view').innerHTML = 'загрузка...'

	if (Hash.mode == 'table') {
		post(host + 'pages/query/table.aspx', Hash, function (text) {
			document.getElementById('view').innerHTML = text
		})
	}
	else {
		post(host + 'pages/query/graph.aspx', Hash, function (text) {
			var json = JSON.parse(text)

			try { createChart(json) } catch (e) { alert('Графики не поддерживаются вашей платформой, нужен современный браузер'); console.log(e); }
		})

	}
}

function getTable() {
	hashSet('mode', 'table')
}

function getGraph() {
	hashSet('mode', 'graph')
}

function exportToExcel() {

	if (isOldBrowser) return alert('Экспорт в Excel не поддерживается вашей платформой, нужен современный браузер')

	try {
		var form = new FormData()
		for (var key in Hash) form.append(key, Hash[key])

		fetch(host + 'pages/query/export.aspx', { method: 'POST', body: form })
			.then(res => res.text())
			.then(text => {
				var el = document.createElement('a')
				document.body.appendChild(el)
				el.href = host + 'content/export/' + text
				el.setAttribute('download', '')
				el.click()
			})
	}
	catch (e) {
		console.log(e)
	}
}

function createChart(json) {
	var counter = Math.round(json.labels.length / 30)
	if (counter < 1) counter = 1

	view.innerHTML = '<div class="right view-graph" id="graph"></div>'
	var chart = new Chartist.Line('#graph', json, {
		axisX: {
			labelInterpolationFnc: function (value, index) {
				return index % counter === 0 ? value : null
			}
		}
	})

	chart.on('created', function () {
		document.querySelectorAll('.ct-point').forEach(function (el) {
			el.onmouseenter = function (e) {
				tooltip.innerHTML = '<b>' + el.parentNode.getAttribute('ct:series-name') + '</b> | ' + el.getAttribute('ct:value')
				tooltip.style.top = e.clientY + 5 + 'px'
				tooltip.style.left = e.clientX + 5 + 'px'
				tooltip.style.display = 'block'
			}
			el.onmouseleave = function () {
				tooltip.style.display = 'none'
				tooltip.innerHTML = ''
			}
		})
	})
}

/* Контролы */

var searchTimeout = 0

var tooltip = document.getElementById('tooltip')

document.getElementById('tags-search-input').oninput = function () {
	clearTimeout(searchTimeout)
	let value = document.getElementById('tags-search-input').value

	searchTimeout = setTimeout(function () {
		hashSet('q', value)
	}, 2500)
}

document.getElementById('tags-search-input').onchange = function () {
	clearTimeout(searchTimeout)
	var value = document.getElementById('tags-search-input').value
	hashSet('q', value)
}

document.getElementById('tags-search-type').oninput = function () {
	hashSet('v', document.getElementById('tags-search-type').value)
}

document.getElementById('tags-search-results').onclick = function (e) {
	var el = e.target.closest('div.tag')
	if (!el) return
	hashSet('t', el.id)
}

document.querySelector('.tags-selected-header').onclick = function () {
	document.querySelector('.tags-selected-header .material-icons').innerHTML = hasClass(document.querySelector('.tags-selected'), 'hide')
		? 'expand_less'
		: 'expand_more'
	toggleClass(document.querySelector('.tags-selected'), 'hide')
}

document.getElementById('tags-selected').onclick = function (e) {
	var el = e.target.closest('div.tag')
	if (!el) return
	hashSet('t', el.id)
}

document.getElementById('server').onchange = function (e) {
	cookie('server', document.getElementById('server').value, { path: '/', expires: 999999999 })
	hashSet('server', document.getElementById('server').value)
}

// кнопка play
document.getElementById('controls-reload').onclick = function () {
	hashSet('c', document.getElementById('controls-cycle').value, true)
	hashSet('s', document.getElementById('controls-date-start').value + ' ' + document.getElementById('controls-time-start').value, true)
	hashSet('e', document.getElementById('controls-date-end').value + ' ' + document.getElementById('controls-time-end').value)
}

/* Прочее */

window.onresize = resize

function resize() {
	let rect = document.getElementById('resizer')
	if (document.body.clientWidth < rect.offsetWidth) document.body.classList.add('min')
	else document.body.classList.remove('min')
}

function cookie(name, value, options) {
	if (value) {
		options = options || { expires: 9999999999 }
		var expires = options.expires;
		if (typeof expires == 'number' && expires) {
			var d = new Date();
			d.setTime(d.getTime() + expires * 1000);
			expires = options.expires = d;
		}
		if (expires && expires.toUTCString) options.expires = expires.toUTCString();
		value = encodeURIComponent('' + value);
		var updatedCookie = name + '=' + value;
		for (var propName in options) {
			updatedCookie += '; ' + propName;
			var propValue = options[propName];
			if (propValue !== true) updatedCookie += '=' + propValue;
		}
		document.cookie = updatedCookie;
	} else {
		var matches = document.cookie.match(new RegExp('(?:^|; )' + (name + '').replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + '=([^;]*)'));
		return matches ? decodeURIComponent(matches[1]) : undefined;
	}
}

function post(path, params, callback) {
	var xhr = new XMLHttpRequest()
	xhr.open('POST', path, true)
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
	xhr.onreadystatechange = function () {
		if (xhr.readyState != 4) return
		if (xhr.status == 200) {
			callback.call(xhr, xhr.responseText)
		}
	}
	var body = []
	for (var key in params) {
		body.push(key + '=' + encodeURIComponent(params[key]))
	}
	console.log(params, body.join('&'))
	xhr.send(body.join('&'))
}

function addClass(el, cls) {
	el.className = el.className.replace(cls, '').trim() + ' ' + cls
}

function removeClass(el, cls) {
	el.className = el.className.replace(cls, '').trim()
}

function hasClass(el, cls) {
	return el.className.indexOf(cls) > -1
}

function toggleClass(el, cls) {
	if (hasClass(el, cls)) removeClass(el, cls)
	else addClass(el, cls)
}

function isArray (obj) {
	return Object.prototype.toString.call(obj) === "[object Array]";
};