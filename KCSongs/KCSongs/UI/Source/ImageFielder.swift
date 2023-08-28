//
//  ImageFielder.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 06.08.2023.
//

import SwiftUI

struct ImageFielder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipShape(Circle())
            .padding(.leading, 12)
    }
}
