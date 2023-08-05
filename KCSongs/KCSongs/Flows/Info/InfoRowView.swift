//
//  InfoRowView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoRowView: View {
    var post: Post

    var body: some View {
        HStack {
            post.image
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .padding(.leading, 12)
            Text(post.title)

            Spacer()
        }
    }
}


struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(post: Post.data[0])
    }
}
