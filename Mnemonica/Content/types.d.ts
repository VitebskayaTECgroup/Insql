declare interface SchemeJson {
	Id: number
	Name: string
	ImageElements: ImageElement[]
	TextElements: TextElement[]
}

declare const EvalProps = {
	Height: 'Height',
	Width: 'Width',
	Class: 'Class',
	Color: 'Color',
	BgColor: 'BgColor',
	Display: 'Display',
	Title: 'Title',
	Z: 'Z',
}

/** Описание изобразительного элемента в JSON */
declare interface ImageElementJson {

	/** Уникальный идентификатор объекта */
	Id: number

	/** Имя объекта, которое видно в диалогах и логах */
	Name: string

	/** Перечень доступных состояний, из которых выбирается отображение */
	States: ImageStateJson[]
	
	/** Функции вычисления свойств, может быть статическим значением */
	Evals: {
		[key: keyof typeof EvalProps]: string
	}
}

/** Возможное состояние изобразительного элемента */
declare interface ImageStateJson {

	/** Токен, по которому определяется состояние */
	Name: string

	/** Понятное описание состояния */
	Description: string

	/** Путь к изображению */
	Source: string
}

/** Описание текстового элемента в JSON */
declare interface TextElementJson {

	/** Уникальный идентификатор объекта */
	Id: number

	/** Имя объекта, которое видно в диалогах и логах */
	Name: string

	/** Функция вычисления содержимого, может быть статическим значением */
	Text: string

	/** Функции вычисления свойств, может быть статическим значением */
	Evals: {
		[key: keyof typeof EvalProps]: string
	}
}