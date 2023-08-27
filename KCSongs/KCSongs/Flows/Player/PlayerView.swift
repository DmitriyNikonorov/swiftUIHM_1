//
//  PlayerView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    @ObservedObject private var viewModel = PlayerModel()

    var body: some View {
        VStack {
            ///
            PlayerCard(
                currentIndex: $viewModel.currentIndex,
                cards: $viewModel.cards,
                name: $viewModel.name,
                isGoForwardTapped: $viewModel.isGoForwardTapped,
                isGoBackTapped: $viewModel.isGoBackTapped
            )

            Spacer()
            ///
            PlayerControls(
                isPlayTapped: $viewModel.isPlayTapped,
                isPlaying: $viewModel.isPlayPause,
                isStop: $viewModel.isStop,
                duration: $viewModel.currentTrackDurationPercents,
                maxTrackDuration: $viewModel.formattedMaxTrackDuration,
                leftTrackDuration: $viewModel.formattedLeftTrackDuration,
                isGoForwardTapped: $viewModel.isGoForwardTapped,
                isGoBackTapped: $viewModel.isGoBackTapped,
                isChanging: $viewModel.isManualChangingDuration,
                isPlayerDisable: $viewModel.isPlayerDisable,
                currentIndex: $viewModel.currentIndex,
                cards: $viewModel.cards,
                isGoBackDisable: $viewModel.isGoBackDisable,
                isGoForwardDisable: $viewModel.isGoForwardDisable
            )
        }
    }
}

struct PlayerCard: View {
    @Binding var currentIndex: Int
    @Binding var cards: [AlbumImageModel]
    @Binding var name: String

    @Binding var isGoForwardTapped: Bool
    @Binding var isGoBackTapped: Bool

    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(cards, id: \.id) { model in
                    AlbumImageView(model: model)
                        .padding(.bottom)
                }
                .gesture(dragGesture(for: currentIndex))

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            Text(name)
                .padding(.bottom, 20)
        }
    }

    private func dragGesture(for tab: Int) -> some Gesture {
        DragGesture()
            .onEnded { value in
                if value.translation.width > 0 {
                    isGoBackTapped.toggle()
                } else {
                    isGoForwardTapped.toggle()
                }
            }
    }
}

struct PlayerControls: View {
    @Binding var isPlayTapped: Bool
    @Binding var isPlaying: Bool
    @Binding var isStop: Bool

    @Binding var duration: Double
    @Binding var maxTrackDuration: String
    @Binding var leftTrackDuration: String

    @Binding var isGoForwardTapped: Bool
    @Binding var isGoBackTapped: Bool

    @Binding var isChanging: Bool
    @Binding var isPlayerDisable: Bool

    @Binding var currentIndex: Int
    @Binding var cards: [AlbumImageModel]

    @Binding var isGoBackDisable: Bool
    @Binding var isGoForwardDisable: Bool

    var range = 0.0...100

    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $duration, in: range) { changed in
                withAnimation {
                        isChanging = changed
                }
            }
            .disabled(isPlayerDisable)

            HStack {
                Text(maxTrackDuration)
                Spacer()
                Text(leftTrackDuration)
            }
            HStack(spacing: 35) {
                /// Backward action
                Button(action: {
                    isGoBackTapped.toggle()
                }) {
                    Image(systemName: "backward.end")
                        .resizable()
                }
                .foregroundColor(isGoBackDisable || isPlayerDisable ? .gray : .black)
                .frame(width: 30, height: 30)
                .disabled(isPlayerDisable || isGoBackDisable)

                /// Play action
                Button(action: {
                    isPlayTapped.toggle()
                }) {
                    Image(
                        systemName: isPlaying
                        ? "pause.circle"
                        : "play.circle"
                    )
                    .resizable()
                }
                .foregroundColor(isPlayerDisable ? .gray : .black)
                .frame(width: 80, height: 80)
                .disabled(isPlayerDisable)


                /// Forward action
                Button(action: {
                    isGoForwardTapped.toggle()
                }) {
                    Image(systemName: "forward.end")
                        .resizable()
                }
                .foregroundColor(isPlayerDisable || isGoForwardDisable ? .gray : .black)
                .frame(width: 30, height: 30)
                .disabled(isPlayerDisable || isGoForwardDisable)
            }
            .padding(20)
            .cornerRadius(20)
        }
        .padding()
    }
}




struct BasicCardView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageView(model: AlbumImageModel(image: AlbumName.acustichesky.rawValue, id: 0))
    }
}
