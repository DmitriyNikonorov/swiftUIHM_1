//
//  SettingsView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct SettingsView: View {
    private let range = 45.0...150.0

    @Environment(\.colorScheme) var colorScheme

    @State private var isChanging = false
    @Binding var rowHeight: Double
    @Binding var isTitleOn: Bool
    @Binding var isAlbumCoversShow: Bool

    @State private var selectedOption = 0
    private let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        ZStack {
            Color(.systemGray5)
            ///
            Form {
                Section {
                    Text(colorScheme == .light ? "Light Theme enabled" : "Dark Theme enabled")
                }
                ///
                Section {
                    Toggle("Show title", isOn: $isTitleOn.animation())
                    if isTitleOn {
                        Text("Navigation title enabled")
                    }
                    Toggle("Show album covers", isOn: $isAlbumCoversShow.animation())
                    if !isAlbumCoversShow {
                        Text("No one will see album covers")
                    }
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(0..<3) { index in
                            Text(options[index])
                        }
                    }
                    Text("\(options[selectedOption]) is selected")
                }
                ///
                Section {
                    Text("Высота ячейки \(Int(rowHeight))")
                    Slider(value: $rowHeight, in: range) { changed in
                        withAnimation {
                            isChanging = changed
                        }
                    }
                    if isChanging {
                            List(Post.demoPost) { post in
                                InfoRowView(
                                    post: post,
                                    isAlbumCoversShow: $isAlbumCoversShow,
                                    rowHeight: $rowHeight
                                )
                                    .frame(height: rowHeight)
                            }
                    }
                }
            }
        }
    }
}
