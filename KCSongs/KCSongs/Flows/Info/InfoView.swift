//
//  InfoView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            List(Post.data) { post in
                NavigationLink {
                    InfoDetailsView(post: post)

                } label: {
                    // view to represent one row of data with image and title
                    InfoRowView(post: post)
                }

            }
            .navigationTitle("Альбомы Киш")
            .listStyle(.plain)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
