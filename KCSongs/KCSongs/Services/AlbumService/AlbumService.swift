//
//  AlbumService.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 24.08.2023.
//

import Foundation
import Combine

final class AlbumService: ObservableObject {
    static let shared = AlbumService()

    private var cancellableSet: Set<AnyCancellable> = []

    // input
    @Published var selectedAlbum = AlbumName.demo

    // output
    var currentAlbum = CurrentValueSubject<Album?, Never>(nil)

    var album: Album? {
        get { return currentAlbum.value }
        set { currentAlbum.send(newValue) }
    }

    init() {
        $selectedAlbum
            .sink { [weak self] albumName in
                guard let self = self else { return }
                self.album = self.getAlbum(albumName: albumName)
            }
            .store(in: &cancellableSet)
    }

    private func getAlbum(albumName: AlbumName) -> Album? {
        AlbumService.albumArray.first {
            $0.name == albumName
        }
    }

    static let albumArray: [Album] = [
        Album(name: AlbumName.acustichesky, image: "akustichesky", album: [
            AudioTrack(name: "Сосиска", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Голые коки", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Тяни!", type: .mp3, image: ""),
            AudioTrack(name: "Прыгну со скалы", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Екатерина", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Спятил отец", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Бедняжка", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Карапуз", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Прерванная любовь, или Арбузная корка", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Песня мушкетеров", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Утренний Рассвет", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Наблюдатель", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Кукла колдуна", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Забытые ботинки", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Девушка и Граф", type: .mp3, image: "akustichesky"),
            AudioTrack(name: "Ведьма и Осел", type: .mp3, image: "akustichesky"),
        ]),

        Album(name: AlbumName.budKakDomaPutnik, image: "bud_kak_doma_putnik", album: [
            AudioTrack(name: "Отец и маски", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Сказка про дракона", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Сапоги Мертвеца", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Паника в селе", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Инструмент", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "История о мертвой женщине", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Валет и Дама", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Два друга и разбойники", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Веселые тролли", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Истинный Убийца", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Король и Шут", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Собрание", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Охотник", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Он не знает, что такое жить", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Лесник", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Кукольный театр", type: .mp3, image: "bud_kak_doma_putnik"),
            AudioTrack(name: "Помоги Мне", type: .mp3, image: "bud_kak_doma_putnik"),
        ]),

        Album(name: AlbumName.buntNaKorable, image: "bunt_na_korable", album: [
            AudioTrack(name: "Хардкор по-русски", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Муха - маленькая птичка", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Идол", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Рыцарь", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Задира и солдат", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Раненый воин", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Северный флот", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Хороший пират - Мертвый пират", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Исповедь вампира", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Инквизитор", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Месть Гарри", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Звонок", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Бунт на корабле!", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Волшебный глаз старика Алонса", type: .mp3, image: "bunt_na_korable"),
            AudioTrack(name: "Хозяин леса", type: .mp3, image: "bunt_na_korable"),
        ]),

        Album(name: AlbumName.geroiZlodei, image: "geroi_i_zlodei", album: [
            AudioTrack(name: "Запрет отца", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Кузнец", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Что видел малыш", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Бродяга И Старик", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Невеста палача", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Про Ивана", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Вор, граф и графиня", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Паника в селе (live)", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Смерть халдея", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Помнят С Горечью Древляне", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Дед на свадьбе", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Мастер приглашает в гости", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Разговор с гоблином", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Разбойники (live)", type: .mp3, image: "geroi_i_zlodei"),
            AudioTrack(name: "Воспоминания о былой", type: .mp3, image: "geroi_i_zlodei"),
        ]),

        Album(name: AlbumName.jalNetRujiyz, image: "jal_net_rujiya", album: [
            AudioTrack(name: "Генрих и Смерть", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Мертвый Анархист", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Утопленник", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Представляю Я", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Смешной Совет", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Медведь", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Песенка Пьяного Деда", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Водяной", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Мой Характер", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Вино хоббитов", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Жаль, нет Ружья!", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Вдова и Горбун", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Волосокрад", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Разборки из-за Баб", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Пьянка", type: .mp3, image: "jal_net_rujiya"),
            AudioTrack(name: "Некромант", type: .mp3, image: "jal_net_rujiya"),
        ]),

        Album(name: AlbumName.kakVSaroySkazke, image: "kak_v_staroy_skazke", album: [
            AudioTrack(name: "Гимн шута", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Два Монаха В Одну Ночь", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Похороны панка", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Кузьма и барин", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Парень и леший", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Возвращение колдуна", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Ответ", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Пивной череп", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Зловещий кузен", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Кто это все придумал", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Рогатый", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Тайна хозяйки старинных часов", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Пират", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Проклятый старый дом", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Скотный двор", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Двухголовый отпрыск", type: .mp3, image: "kak_v_staroy_skazke"),
            AudioTrack(name: "Воспоминания о былой любви", type: .mp3, image: "kak_v_staroy_skazke"),
        ]),

        Album(name: AlbumName.kamnemPoGolove, image: "kamnem_po_golove", album: [
            AudioTrack(name: "Внезапная голова", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "От женщин кругом голова", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Два вора и монета", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Леший обиделся", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Смельчак и ветер", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Верная Жена", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Садовник", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Шар голубой", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Рыбак", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Злодей и шапка", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "С тех пор как он ушел", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Проказник Скоморох", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "В доме суета", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Дурак и молния", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Холодное тело", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Блуждают тени", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Лесные разбойники", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Камнем По Голове", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Любовь и Пропеллер", type: .mp3, image: "kamnem_po_golove"),
            AudioTrack(name: "Мария", type: .mp3, image: "kamnem_po_golove"),
        ]),

        Album(name: AlbumName.prodavecKoshmarov, image: "prodavec_koshmarov", album: [
            AudioTrack(name: "Город мертвецов", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Дочка вурдалака", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Джокер", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Свой среди чужих", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Ром", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Хозяин таверны", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Писатель Гудвин", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Гробовщик", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Пляски на могиле", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Отражение", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Матерый Волк", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Та, что смотрит из пруда", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Продавец кошмаров", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Марионетки", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "В гостях у соседа", type: .mp3, image: "prodavec_koshmarov"),
            AudioTrack(name: "Маска", type: .mp3, image: "prodavec_koshmarov"),
        ]),

        Album(name: AlbumName.teatrDemona, image: "teatr_demona", album: [
            AudioTrack(name: "Мадам Жоржетт", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Танец злобного гения", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Бал лицемеров", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Энди Кауфман", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Киногерой", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Защитники", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Темный учитель", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Король вечного сна", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Послание", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Фокусник", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Бунтарь", type: .mp3, image: "teatr_demona"),
            AudioTrack(name: "Театральный демон", type: .mp3, image: "teatr_demona"),
        ]),

        Album(name: AlbumName.tenKlouna, image: "tenklouna", album: [
            AudioTrack(name: "Дагон", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Вестник", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Полутень клоуна", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Клейменный огнем", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "В Париж домой", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Смешной пистолетик", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Полутень зомби", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Кода", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Ричард Гордон", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Суфлер", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Фред", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Санта Клаус", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Тень клоуна", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "A.M.T.V.", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Двое против всех", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Ходит зомби", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Невидимка", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Тринадцатая рана", type: .mp3, image: "tenklouna"),
            AudioTrack(name: "Полутень Заговор в суде", type: .mp3, image: "tenklouna"),
        ]),

        Album(name: AlbumName.todd, image: "todd", album: [
            AudioTrack(name: "Признание Ловетт (Ария Ловетт)", type: .mp3, image: "todd"),
            AudioTrack(name: "Машина смерти (Ария Ловетт и Мясника)", type: .mp3, image: "todd"),
            AudioTrack(name: "Смертный Приговор (Ария Тодда и Мясника)", type: .mp3, image: "todd"),
            AudioTrack(name: "Первая Кровь (Ария Священника и Тодда)", type: .mp3, image: "todd"),
            AudioTrack(name: "Добрые люди (Хор нищих)", type: .mp3, image: "todd"),
            AudioTrack(name: "Праздник крови (Ария Судьи)", type: .mp3, image: "todd"),
            AudioTrack(name: "Новая Пирожковая (Ария благородной толпы)", type: .mp3, image: "todd"),
            AudioTrack(name: "Счастье (Ария Тодда)", type: .mp3, image: "todd"),
            AudioTrack(name: "Баллада о Бедном Цирюльнике (Ария Бродяги)", type: .mp3, image: "todd"),
            AudioTrack(name: "Каторжник (Ария Тодда)", type: .mp3, image: "todd"),
            AudioTrack(name: "Пирожки от Ловетт (Хор нищих и бродяг)", type: .mp3, image: "todd"),
        ]),
    ]
}
