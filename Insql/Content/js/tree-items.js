var treeItems = {
	'МНЕМОСХЕМЫ': {
		'Sonar': '#/http://server/mnemonica/sonar/',
		'ТЭЦ': '#/http://www.vst.vitebsk.energo.net/mnemo/',
		'Мазутные емкости': '#/http://server/mnemonica/mazut/',
		'РЭП СН-4': '#/http://server/mnemonica/rep_sn4/',
		'ХВО': {
			'ХВО-1': '#/http://server/mnemonica/hvo_1/',
			'ХВО-2': '#/http://server/mnemonica/hvo_2/',
			'Емкости кислоты и щелочи': '#/http://server/mnemonica/hvo/',
			'Конденсатоочистка': '#/http://server/mnemonica/condensatoochistka/',
			'Кислотно-щелочное помещение': '#/http://server/mnemonica/acid_base_room/'
		},
		'KA-3': {
			'VG1. Экран 1': '#/http://server/mnemonica/ka3_vg1_1/',
			'VG1. Экран 2': '#/http://server/mnemonica/ka3_vg1_2/',
			'VG1. Экран 3': '#/http://server/mnemonica/ka3_vg1_3/',
			'VG2. Экран 1': '#/http://server/mnemonica/ka3_vg2_1/',
			'VG2. Экран 2': '#/http://server/mnemonica/ka3_vg2_2/',
			'VG2. Экран 3': '#/http://server/mnemonica/ka3_vg2_3/',
			'Мнемосхема 1': '#/http://server/mnemonica/ka3_vg1_4/',
			'Мнемосхема 2': '#/http://server/mnemonica/ka3_vg2_4/',
			'Схема управления': '#/http://server/mnemonica/ka3_control/'
		},
		'KA-5': {
			'VG1. Экран 1': '#/http://server/mnemonica/ka5_vg1_1/',
			'VG1. Экран 2': '#/http://server/mnemonica/ka5_vg1_2/',
			'VG1. Экран 3': '#/http://server/mnemonica/ka5_vg1_3/',
			'VG1. Экран 4': '#/http://server/mnemonica/ka5_vg1_4/',
			'Мнемосхема 1': '#/http://server/mnemonica/ka5_vg1_5/',
			'Мнемосхема 2': '#/http://server/mnemonica/ka5_vg1_6/',
			'Мнемосхема 3': '#/http://server/mnemonica/ka5_vg1_7/',
		},
		'Электрические схемы': {
			'ОРУ': '#/http://server/mnemonica/el_ORU/',
			'ГРУ2-3': '#/http://server/mnemonica/el_GRU2/',
			'ГРУ-1': '#/http://server/mnemonica/el_GRU1/'
		},
		'Оперативные схемы КТЦ': {
			'Главные паропроводы': '#/http://server/mnemonica/oper_ktc/',
			'Питательные трубопроводы': '#/http://server/mnemonica/oper_ktc_1/',
			'Циркуляционная вода': '#/http://server/mnemonica/oper_ktc_2/'
		},
		'ИБП': '#/http://server/mnemonica/ups/',
		'Прогноз погоды': '#/http://server/pages/weather/'
	},
	'WebQuery: данные и графики': host + 'pages/query/',
	'ОТЧЕТЫ ПО ОБОРУДОВАНИЮ': {
		'РЭП СН №4': '#/devices/rep-sn-4.sql',
		'Сетевой насос 1-2': '#/devices/sn1-2.sql',
		'Температура нар. воздуха': '#/devices/temp-outside.sql',
		'Бойлер горводы': '#/devices/boiler-city-water.sql',
		'ТУРБОАГРЕГАТЫ': {
			'Алармы': host + 'pages/alarms/',
			'Ведомость': '#/devices/turbo/view.sql',
			'ТА-2': {
				'Задания регуляторов': '#/devices/turbines/ta-2/setting.sql'
			},
			'TA-3': {
				'Задания регуляторов': '#/devices/turbines/ta-3/setting.sql',
				'Агрегированные': '#/devices/turbines/ta-3/calc.sql'
			}
		},
		'КОТЛОАГРЕГАТЫ': {
			'К/а № 1': {
				'Расход топлива': '#/devices/boilers/ka1/boiler.sql'
			},
			'К/а № 2': {
				'Расход топлива': '#/devices/boilers/ka2/boiler.sql'
			},
			'К/а № 3': {
				'Расход топлива': '#/devices/boilers/ka3/boiler.sql',
				'Уставки': '#/devices/boilers/ka3/checks.sql',
				'Анализ пусков': '#/devices/boilers/ka3/analyze.sql',
				'Змеевики': '#/devices/boilers/ka3/snakes.sql',
				'Давление воздуха': '#/devices/boilers/ka3/wind_power.sql',
				'Ведомость': '#/devices/boilers/ka3/list.sql',
				'Контроль температуры': {
					'мет. I   ст. ПП': '#/devices/boilers/ka3/temp_acc/metal_1.sql',
					'мет. II  ст. ПП': '#/devices/boilers/ka3/temp_acc/metal_2.sql',
					'мет. III ст. ПП': '#/devices/boilers/ka3/temp_acc/metal_3.sql',
					'мет. IV  ст. ПП': '#/devices/boilers/ka3/temp_acc/metal_4.sql'
				},
				'Суточные ведомости': {
					'Суточная ведомость 1ч.': '#/devices/boilers/ka3/acc/acc1.sql',
					'Суточная ведомость 2ч.': '#/devices/boilers/ka3/acc/acc2.sql',
					'Контроль металла': '#/devices/boilers/ka3/acc/metal.sql'
				}
			},
			'К/а № 4': {
				'Расход топлива': '#/devices/boilers/ka4/boiler.sql',
				'Уставки': '#/devices/boilers/ka4/checks.sql',
				'Газоанализаторы': '#/devices/boilers/ka4/gas.sql'
			},
			'К/а № 5': {
				'Расход топлива': '#/devices/boilers/ka5/boiler.sql',
				'Ведомость': '#/devices/boilers/ka5/list.sql',
				'Ведомость для печати': '#/devices/boilers/ka5/list-print.sql',
				'Контроль температуры': {
					'мет. I   ст. ПП': '#/devices/boilers/ka5/temp_acc/metal_1.sql',
					'мет. II  ст. ПП': '#/devices/boilers/ka5/temp_acc/metal_2.sql',
					'мет. III ст. ПП': '#/devices/boilers/ka5/temp_acc/metal_3.sql',
					'мет. IV  ст. ПП': '#/devices/boilers/ka5/temp_acc/metal_4.sql'
				},
				'Суточные ведомости': {
					'Суточная ведомость 1ч.': '#/devices/boilers/ka5/acc/acc1.sql',
					'Суточная ведомость 2ч.': '#/devices/boilers/ka5/acc/acc2.sql',
					'Контроль металла': '#/devices/boilers/ka5/acc/metal.sql'
				}
			},
			'К/а доп. инфо': '#/devices/boilers/additional.sql'
		},
		'СТКЭР': {
			'ТА-2': '#/devices/stk-er/ta-2.sql',
			'ТА-3': '#/devices/stk-er/ta-3.sql'
		},
		'ДЕАЭРАТОРЫ': {
			'Деаэратор №2 т.о 1 оч.': '#/devices/deaerator/deaerator-2-to-1.sql',
		},
		'МАЗУТНЫЕ ЕМКОСТИ': {
			'Емкость 1': '#/devices/masut/vol-1.sql',
			'Емкость 2': '#/devices/masut/vol-2.sql',
			'Емкость 3': '#/devices/masut/vol-3.sql',
			'Емкость 4': '#/devices/masut/vol-4.sql',
			'Общая масса': '#/devices/masut/mass.sql',
			'Общая высота': '#/devices/masut/height.sql',
			'Ввод параметров мазута': '#/devices/masut/input.sql'
		},
		'Расходомеры': '#/devices/flow-meters.sql'
	},
	'ОТЧЕТЫ ПО СЧЕТЧИКАМ': {
		'КОНТУРЫ ОТОПЛЕНИЯ': {
			'КО 1 очереди': '#/counters/ko/query-1.sql',
			'КО 2 очереди': '#/counters/ko/query-2.sql',
			'БМХ': '#/counters/ko/bmh.sql',
			'КО ПВК': '#/counters/ko/pvk.sql',
			'КО БАЛАНС': '#/counters/ko/balance.sql',
			'КО БАЛАНС (до 03.04.2009)': '#/counters/ko/balance-old.sql'
		},
		'ТЕПЛОСЕТЬ': {
			'Баланс теплосети': '#/counters/ts/ts-balance.sql',
			'Центральная': '#/counters/ts/center.sql',
			'Западная': '#/counters/ts/west.sql',
			'Лучеса': '#/counters/ts/luchesa.sql',
			'ВЗРД': '#/counters/ts/vzrd.sql',
			'ДОК': '#/counters/ts/dok.sql',
			'Подпитка': '#/counters/ts/support.sql',
			'ОСВ через ТГ2': '#/counters/ts/reverse-tg-2.sql',
			'ОСВ через ТГ3': '#/counters/ts/reverse-tg-3.sql',
			'Коэф. погрешностей для расчета небаланса': '#/counters/ts/coefficients.sql',
			'ТС БАЛАНС тест': '#/counters/ts/test-ts-balance.sql',
			'ТС БАЛАНС ЦЕНТРАЛЬНАЯ тест': '#/counters/ts/test-center.sql',
			'ТС БАЛАНС ЗАПАДНАЯ тест': '#/counters/ts/test-west.sql',
			'ТС БАЛАНС Лучеса тест': '#/counters/ts/test-luchesa.sql',
			'Монолит тест': '#/counters/ts/test-vzrd.sql',
			'ДОК тест': '#/counters/ts/test-dok.sql'
		},
		'Уставки ЦТЩУ': '#/counters/sets.sql',
		'ПАР': {
			'КИМ': '#/counters/heat/kim.sql',
			'ДОК': '#/counters/heat/dok.sql',
			'ВЗРД': '#/counters/heat/vzrd.sql',
			'Рубикон': '#/counters/heat/rubikon.sql',
			'Витебские ковры': '#/counters/heat/kovry.sql',
			'Баланс пара': '#/counters/heat/heat-balance.sql'
		},
		'ГАЗ': {
			'Общий': '#/counters/gas/all.sql',
			'Почасовой 9/24': '#/counters/gas/hour.sql',
			'С нараст. итогом': '#/counters/gas/up.sql',
			'Старые отчёты': {
				'Общий (старый)': '#/counters/gas/old-all.sql',
				'Почасовой 9/24 (старый)': '#/counters/gas/old-hour.sql',
				'С нараст. итогом (старый)': '#/counters/gas/old-up.sql'
			}
		},
		'ХИМВОДООЧИСТКА': {
			'ХВО': '#/counters/hvo/hvo.sql',
			'Забор-сброс воды': '#/counters/hvo/in-out.sql',
			'Сбросная вода': '#/counters/hvo/outcome.sql',
			'Городская вода': '#/counters/hvo/city.sql',
			'Баланс забор-сброса воды': '#/counters/hvo/balance.sql',
			'Отвод тепла стоков в реку': '#/counters/hvo/river.sql',
			'СН КО по фильтрам': '#/counters/hvo/self-ko.sql',
			'СН КО по i/o конд в ХЦ': '#/counters/hvo/self-hc.sql',
			'Кислота и щёлочь': '#/counters/hvo/levels.sql',
			'Метраны': '#/counters/hvo/metran.sql'
		},
		'ЭКОМ-3000': {
			'Активная мощность': '#/counters/ecom/active.sql',
			'Реактивная мощность': '#/counters/ecom/reactive.sql',
			'Баланс по э/э': '#/counters/ecom/balance.sql',
			'Диагностика фидеров': '#/counters/ecom/diagnostic.sql'
		},
		'Гидрозатвор': '#/counters/gidrozatvor.sql',
		'ГРП': '#/counters/grp.sql'
	},
	'СВОДНЫЕ ВЕДОМОСТИ': {
		'ПОКАЗАТЕЛИ ЭКОНОМИЧНОСТИ': {
			'ЭКОМ по интервалам': '#/views/economy/ecom.sql',
			'ЭКОМ по интервалам с 01.02.2009': '#/views/economy/ecom-old.sql',
			'Ввод данных': '#/views/economy/input.sql'
		},
		'ПОТЕРИ КОНДЕНСАТА': {
			'ТЭЦ': '#/views/loses/all.sql',
			'КТЦ': '#/views/loses/ktc.sql',
			'ХЦ': '#/views/loses/hc.sql',
			'Сводные': '#/views/loses/list.sql'
		}
	},
	'ДИАГНОСТИКА': {
		'СЛУЖЕБНЫЕ': {
			'Опрос приборов': '#/diagnostic/service/devices.insql.sql',
			'Расхождения времени': '#/diagnostic/service/time-diff.sql',
			'Параметры ТА-2': '#/diagnostic/service/ta-2.sql',
			'Параметры ТА-3 (аналоги)': '#/diagnostic/service/ta-3-analog.sql',
			'Параметры ТА-3 (дискреты)': '#/diagnostic/service/ta-3-discrete.sql',
			'Температура в шкафах': '#/diagnostic/service/temperatures.sql',
			'Температура и влажность в шкафах контроллеров': '#/diagnostic/service/humidity.sql',
			'Двери шкафов контроллеров': '#/diagnostic/service/doors.sql',
			'Состояние СПТ': '#/diagnostic/service/spt.sql',
			'Состояние СТК-ЭР': '#/diagnostic/service/stk-er.sql',
			'Состояние счетчиков': '#/diagnostic/service/counters.sql',
			'G теплосети': '#/diagnostic/service/instant-heat.sql',
			'G пара': '#/diagnostic/service/instant-steam.sql',
			'G КО': '#/diagnostic/service/instant-ko.sql',
			'ЭГСАР': '#/diagnostic/service/esgar.sql',
			'Системный лог InSql': '#/diagnostic/service/insql.sql',
			'Перезапись значений': host + 'pages/editor/'
			/*'Время опроса на счётчиках': '#/diagnostic/service/time.sql',*/
		},
		'ИБП': {
			'ИБП-01. ЦС': '#/diagnostic/ups/ups-01.sql',
			'ИБП-02. Серверная L-A': '#/diagnostic/ups/ups-02.sql',
			'ИБП-03. Серверная L-B': '#/diagnostic/ups/ups-03.sql',
			'ИБП-04. ЛМЗ-97': '#/diagnostic/ups/ups-04.sql',
			'ИБП-05. ЛМЗ-97': '#/diagnostic/ups/ups-05.sql',
			'ИБП-06. РЭП КА-3': '#/diagnostic/ups/ups-06.sql',
			'ИБП-07. ГМ-ПЭН6': '#/diagnostic/ups/ups-07.sql',
			'ИБП-08. АПУ ТА-3': '#/diagnostic/ups/ups-08.sql',
			'ИБП-09. СБК-2': '#/diagnostic/ups/ups-09.sql',
			'ИБП-10. АБК': '#/diagnostic/ups/ups-10.sql',
			'ИБП-11. ШОС': '#/diagnostic/ups/ups-11.sql',
			'ИБП-12. ШОС': '#/diagnostic/ups/ups-12.sql',
			'ИБП-13. ШОС': '#/diagnostic/ups/ups-13.sql',
			'ИБП-14. ШОС': '#/diagnostic/ups/ups-14.sql',
			'ИБП-15. ЭКОМ-3000': '#/diagnostic/ups/ups-15.sql',
			'ИБП-16. ИТ-14': '#/diagnostic/ups/ups-16.sql',
			'ИБП-17. ШКУ': '#/diagnostic/ups/ups-17.sql',
			'ИБП-18. ГРП': '#/diagnostic/ups/ups-18.sql',
			'ИБП-19. ТТЦ': '#/diagnostic/ups/ups-19.sql',
			'ИБП-20. РЭП СН-4': '#/diagnostic/ups/ups-20.sql',
			'ИБП-21. КН 3-1': '#/diagnostic/ups/ups-21.sql',
			'ИБП-22. КА-4': '#/diagnostic/ups/ups-22.sql',
			'ИБП-23. ШПЗ': '#/diagnostic/ups/ups-23.sql',
			'ИБП-24. АСК': '#/diagnostic/ups/ups-24.sql',
			'ИБП-25. РЭП СН 1-2': '#/diagnostic/ups/ups-25.sql'
		}
	}
}