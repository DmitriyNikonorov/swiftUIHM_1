//
//  InfoDetailsView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct InfoDetailsView: View {
    let post: Post

    var body: some View {
        ScrollView {
            post.image
                .resizable()
                .scaledToFit()
                .padding(.top, 12)
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(post.year)
                    .font(.title3).fontWeight(.black)
                    .foregroundColor(.black)
                Divider()
                Text(post.description)
            }
            .padding()

        }
        .navigationTitle(post.title)
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView())
    }

}



struct InfoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetailsView(post: Post.data[0])
    }
}
