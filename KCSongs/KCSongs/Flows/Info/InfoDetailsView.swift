//
//  InfoDetailsView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoDetailsView: View {
    let post: Post
    @Binding var selectedAlbum: AlbumName

    var body: some View {
        ScrollView {
            post.image
                .resizable()
                .scaledToFit()
                .padding(.top, 12)
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                    Button(action: {
                        selectedAlbum = post.title
                    }) {
                        Text(post.title == selectedAlbum
                             ? "В плеере"
                             : "Добавить в плеер")
                    }
                    .foregroundColor(.blue)
                Divider()

                Text(post.year)
                    .font(.title3).fontWeight(.black)
                    .foregroundColor(.black)
                Divider()
                Text(post.description)
            }
            .padding()

        }
        .navigationTitle(post.title.rawValue)
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView())
    }
}
