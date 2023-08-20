//
//  KCSongsApp.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

@main
struct KCSongsApp: App {
    @StateObject var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
        }
    }
}
//struct ContentViewTest: View {
//    @EnvironmentObject var userData: UserData
//
//    var body: some View {
//        VStack {
//            WelcomeView()
//
//            TextField("Enter your username", text: $userData.username)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        .padding()
//    }
//}
//
//struct WelcomeView: View {
//    @EnvironmentObject var userData: UserData
//
//    var body: some View {
//        Text("Welcome, \(userData.username)!")
//    }
//}
//
//@main
//struct KCSongsApp: App {
//    @StateObject var userData = UserData()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentViewTest()
//                .environmentObject(userData)
//        }
//    }
//}


struct Previews_KCSongsApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
