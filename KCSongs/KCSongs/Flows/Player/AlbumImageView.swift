//
//  AlbumImageView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 27.08.2023.
//

import SwiftUI

struct AlbumImageView: View {
    var model: AlbumImageModel

    var body: some View {
            VStack(alignment: .leading) {
                Image(model.image ?? "")
                    .resizable()
                    .frame(width: 250, height: 250)
            }
            .padding(.horizontal)
    }
}
