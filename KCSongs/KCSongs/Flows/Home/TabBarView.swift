//
//  TabBarView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
            TabView() {
                ///
                InfoView()
                    .tabItem {
                        Label("Info", systemImage: "music.note.list")
                    }

                ///
                HelloView()
                    .tabItem {
                        Label("Hello", systemImage: "house")
                    }
                ///
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }

            }
//            .tint(Color(.black))
    }
}


