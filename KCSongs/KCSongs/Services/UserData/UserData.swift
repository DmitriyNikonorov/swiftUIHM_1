//
//  UserData.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 06.08.2023.
//

import SwiftUI

final class UserData: ObservableObject {
    @AppStorage("isTitleOn") var isTitleOn = true
    @AppStorage("isAlbumCoversShow") var isAlbumCoversShow = true
    @AppStorage("rowHeight") var rowHeight = 60.0
}
