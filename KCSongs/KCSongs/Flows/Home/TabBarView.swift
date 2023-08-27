//
//  TabBarView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
            TabView() {
                ///
                InfoView(titleOn: $userData.isTitleOn, isAlbumCoversShow: $userData.isAlbumCoversShow, rowHeight: userData.$rowHeight)
                    .tabItem {
                        Label("Info", systemImage: "music.note.list")
                    }

                ///
                PlayerView()
                    .tabItem {
                        Label("Player", systemImage: "play.circle.fill")
                    }
                ///
                SettingsView(rowHeight: $userData.rowHeight, isTitleOn: $userData.isTitleOn, isAlbumCoversShow: $userData.isAlbumCoversShow)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }

            }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData() // Создаем экземпляр UserData для передачи в TabBarView
        return TabBarView()
            .environmentObject(userData) // Передаем экземпляр UserData как environmentObject
    }
}
