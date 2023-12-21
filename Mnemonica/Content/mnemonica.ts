/**
 * Задачи!
 * 
 * 1. Отобразить схему по собранному шаблону
 *      текстовые элементы
 *      изображения
 * 
 * 2. Циклически обновлять объекты
 * 
 * 3. Обеспечить стандартные диалоговые окна:
 *      просмотр текущего состояния объекта
 *      просмотр истории объекта
 *      просмотр истории схемы
 *      откат схемы на указанное время
 */

$(function () {

	var id = location.hash.replace('#', '')

	$.get('./api/core/scheme', { id: id }).done(function (/**@type{Scheme}*/json) {
		$.each(json.ImageElements, function () {

		})
	})
})

/**
 * 
 * @param {ImageElementJson} json
 */
function ImageElement(json) {

	var self = this
	self.evals = json.Evals

	self.update = function () {
		for (var x in self.evals) {
			eval(x + '=(' + self.evals[x] + ')')
			switch (x) {
				case ''
			}
		}
	}
}

/**
 * Создание тега html с любым уровнем вложенности (реализация hyperscript)
 * @param {string} tagNameRaw Наименование html тега
 */
function h(tagNameRaw) {

	var className = [], id, tag = ''

	// разбор имени (в нем могут быть указаны классы, id и атрибуты)
	var chunks = tagNameRaw.split('.')
	for (var i = 0; i < chunks.length; i++) {
		var x = chunks[i]
		if (x.indexOf('#') > -1) {
			id = x.substring(x.indexOf('#') + 1)
			if (i == 0) tag = x.substring(0, x.indexOf('#'))
			else className.push(x.substring(0, x.indexOf('#')))
		} else {
			if (i == 0) tag = x
			else className.push(x)
		}
	}

	// создание html элемента и присвоение ему разобранных настроек
	var elem = document.createElement(tag)
	if (id) elem.id = id
	if (className.length > 0) elem.className = className.join(' ')

	function parseProp(prop) {
		if (prop === null || prop === undefined) {
			elem.innerHTML = 'NULL'
		}

		else if (isProps(prop)) {
			for (var key in prop) {
				var data = prop[key]
				if (key == 'style') {
					if (isProps(data)) {
						for (var styleProperty in data) {
							elem.style[styleProperty] = data[styleProperty]
						}
					} else elem.setAttribute('style', String(data))
				}
				else if (key == 'className') elem.className = data
				else if (key == 'innerHTML') elem.innerHTML = String(data)
				else if (key == 'value') /** @type {HTMLInputElement} */(elem).value = data
				else if (key == 'checked') /** @type {HTMLInputElement} */(elem).checked = !!data
				else if (typeof data == 'function') elem[key] = data
				else elem.setAttribute(key, String(data))
			}
		}

		else if (isArray(prop)) {
			for (var i = 0; i < prop.length; i++) {
				parseProp(prop[i])
			}
		}

		else if (isNode(prop)) {
			elem.appendChild(prop)
		}

		else if (isPrimitive(prop)) {
			elem.insertAdjacentHTML('beforeend', String(prop))
		}

		function isArray(obj) {
			return (Object.prototype.toString.call(obj) === '[object Array]')
		}

		function isNode(obj) {
			return (obj.tagName && typeof obj === 'object')
		}

		function isProps(obj) {
			return (!obj.length && obj.toString() === '[object Object]')
		}

		function isPrimitive(obj) {
			return (typeof obj === 'string' || typeof obj === 'number' || typeof obj === 'boolean')
		}
	}

	for (var i = 1; i < arguments.length; i++) {
		parseProp(arguments[i])
	}

	return elem
}
