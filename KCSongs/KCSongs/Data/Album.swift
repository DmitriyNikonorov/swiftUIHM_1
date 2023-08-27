//
//  Album.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 26.08.2023.
//

final class Album {
    let name: AlbumName
    let image: String
    var album: [AudioTrack]

    init(name: AlbumName, image: String, album: [AudioTrack]) {
        self.name = name
        self.image = image
        self.album = album
    }
}
