try { document.domain = 'vst.vitebsk.energo.net' } catch (e) { }

function resize() {
	try {
		var w = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth)
		if (w < 900) document.body.style.fontSize = '8px'
		if (w < 1000) document.body.style.fontSize = '9px'
		else if (w < 1100) document.body.style.fontSize = '10px'
		else if (w < 1200) document.body.style.fontSize = '11px'
		else document.body.style.fontSize = '12px'
		 
	} catch (e) {}
}

resize()
window.onresize = function () {
	resize()
}

var link = null
var clock = document.getElementById('clock')
var view = document.getElementById('view')
var tree = document.getElementById('tree')
var search = document.getElementById('search')

var mode = ''
var Step = 0
var pause = false

var reloadInterval
var searchText = ''
var linesBuffer = []
var pickers = {}

var server = cookie('server')
if (!server) {
	cookie('server', 'insql2', { path: '/', expires: 9999999999 })
	server = 'insql2'
}
var el = document.querySelector('[server="' + server + '"]')
if (el) el.className = 'active-server'

for (var key in treeItems) {
	tree.appendChild(Sub(key, treeItems[key]))
}

Clock()
Go()

setInterval(Clock, 1000)
setInterval(Go, 100)
setInterval(Search, 100)

function Sub(name, data) {
	if (data.length) {
		return Link(data, name)
	} else {
		var sub = document.createElement('div')
		sub.className = 'sub'
		if (cookie(name) == 'open') sub.className += ' open'

		var span = document.createElement('span')
		span.innerHTML = '<i>&emsp;</i>' + name
		span.onclick = function () {
			if (sub.className.indexOf('open') > -1) {
				sub.className = 'sub'
				cookie(name, 'close')
			}
			else {
				sub.className = 'sub open'
				cookie(name, 'open')
			}
		}
		sub.appendChild(span)

		for (var key in data) {
			sub.appendChild(Sub(key, data[key]))
		}

		return sub
	}
}

function Lines(name, data) {
	if (data.length) {
		if (name.toLowerCase().indexOf(searchText) > -1) {
			linesBuffer.push(Link(data, name))
		}
	} else {
		for (var key in data) {
			Lines(key, data[key])
		}
	}
}

function Link(url, text) {
	var a = document.createElement('a')
	a.href = url.replace('server', location.hostname)
	a.innerHTML = '<i class="' + (url.indexOf('http') > -1 ? 'mnemo' : 'link') + '">&emsp;</i>' + text
	return a
}

function Clock() {
	clock.innerHTML = new Date().toLocaleTimeString()
}

function Go() {
	var _link = document.location.hash.replace('#/', ''), el
	if (_link != link) {
		clearInterval(reloadInterval)
		link = _link
		var el = document.querySelector('.tree .selected')
		if (el) el.className = ''

		if (link == '') {
			get(host + 'content/text/timeline.html')
		}
		else {
			el = document.querySelector('[href="#/' + link + '"]')
			if (el) el.className = 'selected'

			if (link.indexOf('http') > -1) {
				for (var key in pickers) { try { pickers[key].destroy() } catch (e) {} }
				view.innerHTML = '<iframe name="' + Math.random() + '" src="' + link.replace(/insql1|insql2|insql/g, server) + '?z=' + Math.random() + '" height="100%" width="100%" frameborder="0"></iframe>'
			} else {
				get(host + 'pages/data/table.aspx', 'file=' + link + '&server=' + server)
			}
		}
	}
}

function Search() {
	var text = search.value.toLowerCase()
	if (text != searchText) {
		searchText = text
		tree.innerHTML = ''
		if (text != '') {
			linesBuffer = []
			for (var key in treeItems) {
				Lines(key, treeItems[key])
			}
			for (var i = 0; i < linesBuffer.length; i++) {
				tree.appendChild(linesBuffer[i])
			}
		}
		else {
			for (var key in treeItems) {
				tree.appendChild(Sub(key, treeItems[key]))
			}
		}
		el = document.querySelector('[href="#/' + link + '"]')
		if (el) el.className = 'selected'
	}
}

function load(settings) {
	clearInterval(reloadInterval)
	settings = settings || {}

	var url = 'file=' + link + '&server=' + encodeURIComponent(server)

	if (settings.query) url += '&query=' + encodeURIComponent(settings.query)
	else if (document.getElementById('query')) url += '&query=' + encodeURIComponent(getSelectValue('query'))

	if (settings.date) url += '&date=' + settings.date
	else if (!settings.current && document.getElementById('date')) url += '&date=' + encodeURIComponent(getValue('date') + ' ' + getValue('time'))

	if (settings.step == 'back' || settings.step == 'forward') url += '&step=' + settings.step

	if (settings.down) url += '&down=1'
	if (settings.live) url += '&live=1'

	get(host + 'pages/data/table.aspx', url, function () {
		if (settings.scroll) {
			try {
				var el = document.getElementById('data')
				el.scrollTo(0, el.scrollHeight)
			} catch (e) {}
		}
	})
}


function toServer(elem) {
	var serverName = elem.getAttribute('server')
	server = serverName
	cookie('server', serverName, { path: '/', expires: 999999999 })
	var el = document.querySelector('.active-server')
	if (el) el.className = ''
	elem.className = 'active-server'
	link = null
	Go()
}

function get(url, params, callback) {
	var el = document.getElementById('timer')
	if (el) {
		el.style.width = '0'
		el.className += ' preloader'
	}
	var i = 0

	clearInterval(reloadInterval)
	reloadInterval = setInterval(function () {
		if (el && i < 100) el.style.width = i++ + '%'
	}, 10)

	var xhr = new XMLHttpRequest()
	xhr.open('GET', (url + '?z=' + Math.random() + '&' + params).replace(/insql1|insql2|insql/g, server), true)
	xhr.onreadystatechange = function () {
		if (xhr.readyState != 4) return

		clearInterval(reloadInterval)
		if (el) el.style.width = '100%'

		setTimeout(function () {

			for (var key in pickers) { try { pickers[key].destroy() } catch (e) {} }

			try {
				var tip = document.getElementById('floatTip')
				if (tip) tip.parentNode.removeChild(tip)
			} catch (e) {}

			if (xhr.status > 302) {
				view.innerHTML = '<pre>На сервере возникла ошибка при получении данных.' + 
					'\n\nВозможные причины:' + 
					'\n\t1. Выбран слишком большой диапазон времени для отображения' +
					'\n\t2. Сервер InSQL в данный момент перезагружается' + 
					'\n\t3. Недостоверные данные в расчётных формулах отчёта' + 
					'\n\t4. Внутренняя ошибка сервера' +
					'\n\nПожалуйста, сообщите об ошибке в уАСУТП по тел. 3-32' +
					'</pre>'
				return
			}

			view.innerHTML = xhr.responseText

			try {
				pickers['date'] = new DatePicker({ 
					el: '#date',
					format: 'dd.MM.yyyy',
					onSelect: function () {
						load()
					}
				})
			} catch (e) {}
			try {
				pickers['time'] = new TimePicker({
					el: '#time',
					format: 'hh:mm:ss',
					step: 60,
					onSelect: function () {
						load()
					}
				})
			} catch (e) {}

			try {
				var scripts = view.querySelectorAll('script')
				for (var i = 0; i < scripts.length; i++) {
					try { eval(scripts[i].innerHTML) } catch (e) { }
				}
			} catch (e) {}
			
			if (callback) callback()
		}, 10)
	}
	xhr.send(null)
}

function startTimer(interval) {

	if (!interval) return
	interval = +interval
	clearInterval(reloadInterval)

	mode = 'now'

	var dateStart = new Date()
	var step = interval / 1000
	reloadInterval = setInterval(function () {
		var diff = new Date() - dateStart
		if (!pause) {
			if (diff >= interval) {
				load({ current: true, scroll: true, live: true })
			}
			else {
				var el = document.getElementById('timer')
				if (el) el.style.width = (diff / interval * 100) + '%'
			}
		}
	}, step)
}

function getValue(id) {
	var el = document.getElementById(id)
	return el ? (el.value || null) : null
}

function getSelectValue(id) {
	var el = document.getElementById(id)
	if (!el) return null
	var option = el.options[el.selectedIndex]
	if (!option) return null
	return option.value || option.innerHTML || null
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


document.onmousemove = moveTip;

function moveTip(e) {
	var floatTip = document.getElementById("floatTip")
	if (!floatTip) return false
	document.body.appendChild(floatTip)

	var x = 0
	var y = 0

	if (document.all) {
		x = event.clientX + document.body.scrollLeft
		y = event.clientY + document.body.scrollTop
	} else {
		x = e.pageX
		y = e.pageY
	}

	try { floatTip.style.left = x + 10 + 'px' } catch (e) {}
	try { floatTip.style.top =  y  + 10 + 'px' } catch (e) {}
}

function toolTip(msg) {
	var floatTip = document.getElementById("floatTip")
	if (!floatTip) return false

	if (msg) {
		floatTip.innerHTML = msg
		floatTip.style.display = "block"
	} else {
		floatTip.style.display = "none"
	}
}

function toggleSummary() {
	var rows = document.querySelectorAll('.datatable tfoot tr')
	var show = rows[1].style.display == 'none'
	for (var i = 1; i < rows.length; i++) {
		rows[i].style.display = show ? '' : 'none'
	}
}



function info(open) {
	pause = open
	var el = document.getElementById('info')
	if (!el) return
	el.style.display = open ? 'block' : 'none'
}

function exportQuery(button) {
	button.disabled = true
	button.innerHTML = '<span class="img img-info">обработка...</span>'
	var url = host + 'pages/data/export.aspx' +
		'?z=' + Math.random() +
		'&file=' + link +
		'&server=' + server +
		'&query=' + encodeURIComponent(getSelectValue('query')) +
		'&date=' + encodeURIComponent(getValue('date') + ' ' + getValue('time'))

	var xhr = new XMLHttpRequest()
	xhr.open('GET', url, true)
	xhr.setRequestHeader('Content-Type', 'text/html; charset=Windows-1251')
	xhr.onreadystatechange = function () {
		if (xhr.readyState != 4) return
		button.disabled = false
		button.innerHTML = '<span class="img img-info">Экспорт</span>'
		if (xhr.responseText.indexOf('|') < 0) {
			var el = document.createElement('a')
			document.body.appendChild(el)
			el.href = host + 'content/export/' + xhr.responseText
			el.setAttribute('download', '')
			el.click()
		} else {
			alert(xhr.responseText.replace('error|', 'Ошибка при создании Excel файла: '))
		}
	}
	xhr.send(null)
}

function edit(button, date, server) {

	pause = true

	var cell = button.parentNode
	var row = cell.parentNode
	var cells = row.getElementsByTagName('td')

	for (var i = 0; i < cells.length; i++) {
		if (cells[i].hasAttribute('edit')) {
			cells[i].innerHTML = '<input name="' + cells[i].getAttribute('edit') + '" previous="' + cells[i].innerHTML + '" value="' + cells[i].innerHTML + '" />'
		}
	}
	button.innerHTML = 'сохр.'
	button.onclick = function () {

		var overlay = document.createElement('div')
		overlay.id = 'overlay'
		document.body.appendChild(overlay)

		var modal = document.createElement('modal')
		modal.id = 'modal'
		modal.innerHTML = '<table>'
			+ '<tr><td>Начальная дата</td><td><input value="' + date + '" /></td></tr>'
			+ '<tr><td>Конечная дата</td><td><input value="' + date + '" /></td></tr>'
			+ '</table>'
		document.body.appendChild(modal)

		var save = document.createElement('button')
		save.innerHTML = 'Сохранить введенные данные'
		save.onclick = function () {

			var inputs = modal.getElementsByTagName('input')
			var tags = []

			for (var i = 0; i < cells.length; i++) {
				if (cells[i].hasAttribute('edit')) {
					var inp = cells[i].getElementsByTagName('input')[0]
					if (inp) tags.push(inp.getAttribute('name') + '|' + inp.value)
				}
			}
			
			var xhr = new XMLHttpRequest()
			xhr.open('POST', host + 'pages/data/edit.aspx' + '?z=' + Math.random(), true)
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
			xhr.onreadystatechange = function () {
				if (xhr.readyState != 4) return
				
				if (xhr.responseText != '') alert(xhr.responseText)
				else {

					alert('Данные сохранены. Изменение может занять время из-за специфики работы Industrial SQL')
					pause = false

					document.body.removeChild(overlay)
					document.body.removeChild(modal)

					if (mode == 'history') Filter(Step)
					else Time(true)
				}
			}
			xhr.send(
				'start=' + encodeURIComponent(inputs[0].value) +
				'&finish=' + encodeURIComponent(inputs[1].value) +
				'&server=' + encodeURIComponent(server) +
				'&tags=' + encodeURIComponent(tags.join('---'))
			)
		}
		modal.appendChild(save)
		modal.insertAdjacentHTML('beforeend', '<br />')

		var back = document.createElement('button')
		back.innerHTML = 'Отмена ввода'
		back.onclick = function () {
			pause = false

			document.body.removeChild(overlay)
			document.body.removeChild(modal)

			for (var i = 0; i < cells.length; i++) {
				if (cells[i].hasAttribute('edit')) {
					cells[i].innerHTML = cells[i].querySelector('input').getAttribute('previous')
				}
			}
			button.innerHTML = 'изм.'
			button.onclick = function () { edit(button, date) }
		}
		modal.appendChild(back)
	}
}