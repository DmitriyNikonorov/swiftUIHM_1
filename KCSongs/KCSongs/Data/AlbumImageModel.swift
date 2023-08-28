//
//  AlbumImageModel.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 27.08.2023.
//

import Foundation

struct AlbumImageModel: Identifiable {
    var image: String?
    var id: Int

    init(image: String? = nil, id: Int) {
        self.image = image
        self.id = id
    }
}
