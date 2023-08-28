//
//  CurrentTrack.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 24.08.2023.
//

final class CurrentTrack: AudioTrack {
    var currentIndex: Int
    init(currentIndex: Int, track: AudioTrack) {
        self.currentIndex = currentIndex
        super.init(name: track.name, type: track.type, image: track.image)
    }
}
