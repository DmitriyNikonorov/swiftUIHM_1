//
//  InfoRowView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoRowView: View {
    var post: Post
    @Binding var isAlbumCoversShow: Bool
    @Binding var rowHeight: Double

    private func setTextSize() -> CGFloat {
        switch rowHeight {
        case 45...90:
            return 16
        case 90...110:
            return 20
        case 110...150:
            return 23
        default:
            return 15
        }
    }

    var body: some View {
        HStack {
            isAlbumCoversShow
            ? AlbumImage(image: post.image, size: $rowHeight)
            : AlbumImage(image: Image("hidden"), size: $rowHeight)
            Text(post.title).font(Font.custom("Lato-Regular", size: setTextSize()))
            Spacer()
        }
    }
}
