//
//  AlbumImage.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 06.08.2023.
//

import SwiftUI

struct AlbumImage: View {
    var image: Image
    @Binding var size: Double
    var body: some View {
        image
            .resizable()
            .modifier(ImageFielder())
            .frame(width: size, height: size)
            .padding(.trailing, 8)
    }
}
