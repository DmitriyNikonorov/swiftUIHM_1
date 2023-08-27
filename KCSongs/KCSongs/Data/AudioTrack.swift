//
//  AudioTrack.swift
//  AVFoundation_Audio
//
//  Created by Дмитрий Никоноров on 20.08.2023.
//

import Foundation

class AudioTrack {
    enum FormatOfTrack: String {
        case mp3
    }

    var name: String
    var type: FormatOfTrack
    var image: String?
    lazy var url = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: type.rawValue) ?? "")

    init(name: String, type: FormatOfTrack, image: String? = nil) {
        self.name = name
        self.type = type
        self.image = image
    }
}
