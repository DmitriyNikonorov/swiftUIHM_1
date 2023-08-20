//
//  InfoView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoView: View {
    @Binding var titleOn: Bool
    @Binding var isAlbumCoversShow: Bool
    @Binding var rowHeight: Double

    var body: some View {
        NavigationView {
            List(Post.data) { post in
                NavigationLink {
                    InfoDetailsView(post: post)

                } label: {
                    // view to represent one row of data with image and title
                    InfoRowView(post: post, isAlbumCoversShow: $isAlbumCoversShow, rowHeight: $rowHeight)
                }
                .frame(height: rowHeight)
            }
            .navigationTitle(titleOn ? "Альбомы Киш" : "")
            .listStyle(.plain)

        }
    }
}

struct InfoView_Previews: PreviewProvider {
    @State static var titleOn = true
    @State static var isAlbumCoversShow = true
    @State static var rowHeight = 60.0

    static var previews: some View {
        InfoView(titleOn: $titleOn, isAlbumCoversShow: $isAlbumCoversShow, rowHeight: $rowHeight)
    }
}
