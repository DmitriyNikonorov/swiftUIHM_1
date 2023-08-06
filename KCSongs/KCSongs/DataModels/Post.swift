//
//  Post.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct Post: Identifiable {
    var id: String

    let title: String
    let description: String
    let year: String
    let image: Image

    static let data = [
        Post(
            id: UUID().uuidString,
            title:"Камнем по голове",
            description:
            """
            К моменту выхода этого альбома группа «Король и Шут» уже успела отлично себя зарекомендовать на клубной сцене. Коллектив регулярно выступал в основанном Севой Гаккелем клубе tAm-tAm, причём был одним из самых яркий в этой тусовке. К моменту записи дебютного альбома команда существовала без малого десять лет (если учитывать период группы «Контора»).

            В декабре 1995 года из армии демобилизовался Андрей «Князь» Князев. Со службы он вернулся не только в хорошем настроении, но и с большим запасом новых песен. Группа приступает к работе над новым материалом. Впервые новые произведения прозвучали со сцены в феврале 1996 года, причём часть песен Михаил Горшенёв пел, подглядывая в шпаргалку. Состав коллектива усиливается гитаристом Яковым Цвиркуновым и музыканты готовятся приступить к сессиям звукозаписи.

            Непосредственно запись альбома группы «Король и Шут» «Камнем по голове» проходила в августе и сентябре 1996 года на Петербургской студии грамзаписи (бывшая «Мелодия»). В то же время коллектив принял участие в программе «Белая полоса» Петербургского телевидения, в рамках которой исполнил несколько песен. Позже эти съёмки музыканты стали позиционировать как официальные клипы. Это видео очень помогло коллективу в продвижении своей дебютной пластинки.

            Издать запись любезно согласилась компания «Курицца рекордс», принадлежавшая Сергею Курёхину, Алексею Ершову и Сергею Селиванову. Фирма напечатала тираж альбома на магнитофонных кассетах, однако помочь с распространением фонограммы не смогла из-за отсутствия налаженной сети сбыта. В итоге кассеты передавались из рук в руки, а также продавались на концертах «Короля и Шута». Львиная доля тиража этого издания была распродана на презентации альбома, которая прошла в клубе «Ватрушка».
            """,
            year: "1996",
            image: Image("kamnem_po_golove")
        ),
        Post(
            id: UUID().uuidString,
            title: "Будь как дома, путник",
            description:
            """
            Первый вариант альбома группы «Король и Шут» «Будь как дома, путник» был опубликован в 1994 году. Первоначальный трек-лист этой пластинки состоял из десяти композиций, то есть – был значительно короче версии, считающейся теперь канонической. Запись материала проходила в период с октября по декабрь 1993 года.

            На момент записи первого варианта альбома двое постоянных участников коллектива проходили службу в рядах вооружённых сил Российской Федерации и не смогли принять участие в работе. Речь идёт об Андрее Князеве и Александре Щиголеве. Вместо них к записи песен свободные от службы музыканты «КиШ» привлекли участников группы Awesome, которые помогли в сведении материала.

            На барабанах в первом варианте альбома играл Алексей Горшенёв, ныне известный как лидер группы «Кукрыниксы». В тот же период вокальные партии Андрея Князева на концертах исполнял бас-гитарист Александр «Балу» Балунов. Тогда же на концертах распространялся самиздатовский вариант альбома «Будь как дома, путник», трек-лист которого состоял из одиннадцати композиций. Однако, позже трек «Мария» был изъят из фонограммы, а сама песня вошла в студийный альбом «Камнем по голове».

            В 1996 году группа «Король и Шут» успешно выступила на рок-фестивале «Наполним небо добротой», который в Санкт-Петербурге устроила группа «ДДТ». После своего триумфа музыканты решили перезаписать имеющийся материал, воспользовавшись услугами студии «ДДТ». Запись песен проходила в августе 1997 года.
            """,
            year: "1994",
            image: Image("bud_kak_doma_putnik")
        ),
        Post(
            id: UUID().uuidString,
            title: "Акустический Альбом",
            description:
            """
        История «Акустического Альбома» группы «Король и Шут» началась в 1995 году, когда музыканты коллектива сделали демо-запись под названием «Любовь Негодяя». Спустя десять лет под таким названием выйдет сольный альбом Андрея Князева, но войдут в него уже другие произведения. Демо было сделано в домашних условиях, запись производилась на ленточный магнитофон в квартире троюродного брата Князя Дмитрия Смирнова.

        Спустя год, уже после выпуска альбома «Камнем по голове», музыканты знакомятся с Игорем «Панкером» Гудковым, который помогает им сделать акустический концерт. Однако, незадолго до премьеры программы Михаил Горшенёв попадает в больницу и не может принять участие в выступлении. Остальные музыканты за считанные дни до концерта делают аранжировки к написанным Князем песням, привлекая к репетиционному процессу Александра «Ренегата» Леонтьева, ныне лидера группы «Северный Флот», а в то время игравшего в группе «Кукрыниксы».

        Отыграв акустическую программу музыканты принимают решение зафиксировать эти песни в студии, используя только акустические инструменты. Запись финансировала компания «Курицца рекордс», с которой у коллектива на тот момент был заключён контракт. Лейбл обеспечил все необходимые для комфортной работы условия, арендовав студию фирмы «Мелодия», расположенную в средневековой лютеранской церкви на Васильевском острове.

        Однако, Михаил Горшенёв не был удовлетворён получившимся результатом и даже не хотел выпускать альбом под маркой «Короля и Шута». Он предлагал выпустить диск как сольник Князя, но это уже не устроило издателя, поскольку известность фронтменов коллектива пока ещё не позволяла успешно продавать их авторские проекты. Идею не поддержали и остальные участники группы, посчитавшие, что их вклад достаточно велик для того, чтобы позиционировать пластинку как продукт коллективного творчества. В итоге был найден компромисс: Михаил настоял на том, чтобы запись вышла под названием «Акустический Альбом», против чего коллеги возражать не стали.

        Тем не менее, проблемы с выпуском диска всё же возникли. Грянул август 1998 года, кардинальным образом изменивший экономическую ситуацию в стране. Многие музыканты были вынуждены корректировать свои планы. Например, сложности возникли у группы «ДДТ», которой пришлось перенести релиз альбома «Мир Номер Ноль» на более поздний период, а группа «Калинов Мост» не смогла окупить расходы по выпуску диска «Оружие». Не пережила кризис и компания «Курицца рекордс», после банкротства которой права на только что записанный материал перешли к группе «Король и Шут».

        Музыканты не могли выпустить пластинку в течение года. Но однажды случай свёл их с Еленой Карповой, работавшей на телеканале РТР и являвщейся сотрудницей рекорд-лейбла «ОРТ рекордс», который возглавлял Иосиф Пригожин. Она рекомендовала продюсеру перспективных музыкантов, только что собравших полный ДС «Юбилейный» в Питере. В ходе переговоров с коллективом издатель выкупил права на фонограмму за 30 000 долларов. Диск, наконец, был издан.
        """,
            year: "1999",
            image: Image("akustichesky")
        ),
        Post(
            id: UUID().uuidString,
            title: "Герои и Злодеи",
            description:
            """
            После выхода в 1999 году коммерчески успешного «Акустического Альбома» группа «Король и Шут» начинает активно гастролировать. В то же время музыканты, следуя условиям контракта со звукозаписывающей компанией, начинают работу над новой пластинкой. Поскольку не все участники команды были довольны предыдущим диском, новый решили делать в традиционном для «КиШ» ключе.\

            Из-за плотного концертного графика музыкантам пришлось записывать песни урывками. Это не могло не сказаться на конечном результате. Отсутствие времени и накопившаяся усталость оказывали своё влияние на ход работы. В конечном итоге, как вспоминали сами музыканты, им не удалось довести до ума ни аранжировки, ни тексты песен. Тем не менее, альбом удался, хотя Андрей Князев считает его звук неудачным.

            Запись материала производилась в петербургской студии «Добролёт». В качестве саунд-продюсера к работе над диском музыканты привлекли Евгения Лёвина, в то время числившегося штатным звукорежиссёром известной студии, но более известным как гитарист группы «Алиса». Перед ним была поставлена задача сделать качественный звук, близкий к современному западному панк-року. В итоге тон в саунде стали задавать гитары, но идеальным звук не получился, во многом из-за того, что мастеринг пластинки делал другой звукорежиссёр.
            """,
            year: "1999",
            image: Image("geroi_i_zlodei")
        ),

        Post(
            id: UUID().uuidString,
            title: "Как в старой сказке",
            description:
            """
            К разработке очередной пластинки музыканты группы «Король и Шут» приступили осенью 2000 года. В готовящийся альбом они хотели включить как новые композиции, так и старые произведения, по тем или иным причинам ранее не имевшие студийного воплощения. Премьера нескольких новых песен состоялась на концерте 20 октября 2000 года в Кургане, где группа выступала без Михаила Горшенёва, который в очередной раз попал в больницу.

            К чистовой записи альбома «Как в старой сказке» «Король и Шут» приступили 19 июля 2001 года. Для фиксации материала на плёнку была выбрана петербургская студия «Мелодия». Вся работа была завершена в течение месяца, при этом Андрей Князев свои партии подготовил заблаговременно, в то время как Михаил тянул до последнего и подключился к созданию пластинки лишь на финальном этапе.

            Концертная презентация альбома состоялась 19 октября 2001 года в петербургском ДС «Юбилейный». Однако, диски на этом выступлении ещё не продавались, поскольку издатель не успел подготовить тираж. В рамках выступления прозвучали почти все составившие альбом композиции, а также был представлен клип «Короля и Шута» «Проклятый старый дом».

            Необычной была московская презентация пластинки. Она состоялась 15 декабря в Лужниках и поразила поклонников театрализованностью. Сцена была оформлена в виде старого пня, на котором и разворачивались события старой сказки. Располагалась она в центре зала. С новой программой музыканты объехали десятки городов России и соседних стран.
            """,
            year: "2001",
            image: Image("kak_v_staroy_skazke")
        ),
        Post(
            id: UUID().uuidString,
            title: "Жаль, нет ружья",
            description:
            """
            К репетициям песен для этой пластинки музыканты приступили весной 2002 года. Согласно условиям контракта с выпускающей компанией, новую студийную работу коллектив должен был предоставить к осени. В этом отношении судьба альбома группы «Король и Шут» «Жаль, нет ружья» схожа с судьбой пластинки «Герои и Злодеи», также делавшейся в спешке.

            Как обычно, музыканты хотели сделать долгоиграющий диск, включив в него как можно больше песен. В работу шли как новые произведения, так и песни времён «Конторы», как, например, «Пьянка», входившая в магнитоальбом «Ересь». Отдельные композиции создавались, либо дорабатывались прямо в студии. Ярчайший пример – песня «Мёртвый анархист», текст которой был написан в последний день студийной работы.

            Запись материала производилась на петербургской студии «Добролёт». Саунд-продюсерами этой работы стали Павел Сажинов и Евгений Лёвин – ныне гитарист группы «Алиса». Работа над пластинкой затянулась и чтобы сдать издателю мастер-копию в срок коллективу приходилось договариваться с коллегами, чтобы те уступили им студийное время.

            Альбом выпускающая компания получила вовремя, но из-за нехватки времени некоторые композиции не удалось свести так, как планировалось. Поэтому к концертам-презентациям диск был выпущен массовым тиражом. В дальнейшем неудавшиеся треки были пересведены, а издатель напечатал второй, исправленный тираж дисков. Запись московской презентации пластинки легла в основу концертного альбома «Мёртвый Анархист».
            """,
            year: "2002",
            image: Image("jal_net_rujiya")
        ),
        Post(
            id: UUID().uuidString,
            title: "Бунт на корабле",
            description:
            """
            В работе над этой пластинкой музыканты решили отойти от стандартной практики студийной деятельности. Работая над композициями, они заметили, что обычно «сырые» версии произведений звучат намного мощнее и убедительнее альбомных вариантов. Это натолкнуло ребят на мысль сыграть альбом живьём и сделать минимум дописок. В итоге, отредактированы были лишь отдельные инструментальные партии, а также методом наложения на готовую фонограмму записывался вокал.

            Такой способ фиксации материала музыкантам предложил звукорежиссёр Павел Сажинов, работавший с ними и над предыдущей пластинкой – «Жаль, нет ружья». Музыка к песням была записана всего за два дня и, что самое главное – в ней удалось сохранить присущий «Королю и Шуту» драйв. Кроме того, благодаря новому методу записи коллектив получил пластинку, кардинальным образом отличающуюся от всех предыдущих работ.

            Сведение и мастеринг альбома производились в Германии по инициативе саунд-продюсера диска Евгения Лёвина. С 2003 года на тех же студиях сводились альбомы «Алисы», в которой Лёвин играет на гитаре. Мастеринг пластинки производился на Skyline Tonfabric, а делал его Петер Крик, к слову, высоко оценивший качество альбома «Бунт на корабле» «Король и Шут».

            Кстати, рабочим названием этого альбома было «Северный Флот». Иное название имела и песня, давшая имя пластинке. Изначально она называлась «Капитан». После выхода альбома Михаил Горшенёв говорил, что музыкантам не удалось в этой работе реализовать все задумки и не исключал, что в будущем будет проведена работа над ошибками. Однако, проект так и не был реализован.
            """,
            year: "2004",
            image: Image("bunt_na_korable")
        ),
        Post(
            id: UUID().uuidString,
            title: "Продавец Кошмаров",
            description:
            """
            Первая информация об этом альбоме появилась практически сразу после выхода предыдущей пластинки – «Бунт на корабле». Тогда фронтмены «КиШ» говорили в интервью, что планируют записать мелодичные и распевные песни, сделав звучание диска похожим на ранние работы. Непосредственно к записи произведений ребята приступают в 2006 году.

            Период работы над альбомом группы «Король и Шут» «Продавец Кошмаров» ознаменовался нестабильностью состава. В начале 2006 года коллектив покидает один из его основателей Александр «Балу» Балунов, отправившийся на ПМЖ в Америку. Вместо него на басу играет Александр «Ренегат» Леонтьев, но вскоре и он уходит из группы, принимая участие в работе над новыми песнями в качестве сессионщика.

            Однако, этот период запомнился не только потерями, но и приобретениями. Так, например, с подачи Андрея Князева в группу приходит скрипач Дмитрий «Каспер» Ришко, принимавший участие в записи сольника Князя «Любовь Негодяя». Таким образом, впервые после альбома «Как в старой сказке» в песнях «Короля и Шута» снова зазвучала скрипка.

            Запись альбома проходила на петербургских студиях «Добролёт» и «Нева». Звукорежиссёрскую работу выполнял Павел Сажинов, а саунд-продюсером диска стал Сергей Большаков. Он занимался сведением и мастерингом пластинки на московской студии «Наше время».
            """,
            year: "2006",
            image: Image("prodavec_koshmarov")
        ),
        Post(
            id: UUID().uuidString,
            title: "Тень Клоуна",
            description:
            """
            После выпуска пластинки «Продавец Кошмаров» музыканты захотели отойти от тяжёлого гитарного звучания и сделать новый диск более мелодичным. Это потребовало произвести очередные замены в составе команды. Впервые за всю историю в группе появился клавишник – на эту должность художественные руководители коллектива взяли своего звукорежиссёра Павла Сажинова.

            К работе над новым материалом музыканты приступили в 2007 году. Тогда были записаны партии барабанов. Остальные инструменты фиксировались на плёнку в течение следующего года. Финальной стадией студийной работы стала запись голосов вокалистов, которая была завершена в августе 2008 года.

            Комментируя название альбома группы «Король и Шут» «Тень Клоуна», Андрей Князев говорил, что их клоун необычен, он обладает мистической тенью, питающейся смехом людей. Отталкиваясь от особенности главного персонажа, песни в альбоме музыканты назвали тенями, а стихотворения, присутствующие между некоторыми треками – полутенями. Необычен и сам выбор главного действующего лица, ведь на протяжении всей творческой истории «КиШ» таковым был шут в разных проявлениях.

            Запись материала производилась на петербургской студии «Станция звука». Там же было выполнено сведение композиций. Мастеринг пластинки музыканты отправились делать в Москву, выбрав для этой процедуры тон-студию киноконцерна «Мосфильм».
            """,
            year: "2008",
            image: Image("tenklouna")
        ),
        Post(
            id: UUID().uuidString,
            title: "Театр Демона",
            description:
            """
            Альбом «Театр Демона» вырос из желания музыкантов создать акустическую концертную программу для исполнения в небольших залах. Изначально они планировали отобрать несколько песен из своего репертуара и сделать к ним новые аранжировки, без использования электроники и электрических гитар. Однако, в ходе рабочего процесса идея трансформировалась в желание написать новый материал и сделать полноценную пластинку, фактически ставшую второй частью изданного в 1998 году «Акустического Альбома».

            Концепцию новой работы фронтмены группы «Король и Шут» трактовали по-разному. Так, например, Андрей Князев утверждал, что коллектив просто захотел сделать пластинку в стиле арт-панка без философского подтекста. Иного взгляда придерживался Михаил Горшенёв: в его понимании арт-панк – это гипотетическое путешествие в XIX столетие, в ходе которого современные музыканты сыграли свои произведения на инструментах того времени, а воротившись назад воплотили сыгранную ими музыку в стилистике своей эпохи.

            Запись альбома производилась в петербургских студиях «Станция звука» и «Мелодия». Релиз пластинки был назначен на 11 октября 2010 года, однако в интернете запись опубликовали на неделю раньше. Спустя два дня после выхода диска Князев и Горшенёв провели автограф-сессию в одном из московских торговых центров, в рамках которой в течение нескольких часов общались с поклонниками. Столичная презентация новинки прошла 28 ноября в клубе Arena Moscow.
            """,
            year: "2010",
            image: Image("teatr_demona")
        ),
        Post(
            id: UUID().uuidString,
            title: "Todd",
            description:
            """
            Запись первой части истории цирюльника-убийцы производилась в петербургской студии «Станция звука». Официальный релиз альбома состоялся 8 декабря 2011 года. В «Праздник Крови» вошли наиболее жёсткие и тяжёлые композиции дилогии. В записи песен этой части пластинки приняли участие лидер группы «Алиса» Константин Кинчев, вокалистка группировки «Ленинград» Юлия Коган и лидер группы Billy’s Band Билли Новик.
            """,
            year: "2011",
            image: Image("todd")
        ),
    ]

    static let demoPost = [
        Post(
            id: "1",
            title: "Мертвый анархист",
            description: "",
            year: "",
            image: Image("mertviy_anarhist")
        )
    ]
}
