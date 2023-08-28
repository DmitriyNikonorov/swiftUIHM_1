//
//  PlayerModel.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 20.08.2023.
//

import SwiftUI
import Combine
import AVFoundation

final class PlayerModel: ObservableObject {
    @ObservedObject private var albumService = AlbumService.shared

    private var arrayOfTracks: [AudioTrack] = []
    private var currentTrack: CurrentTrack?

//    private let firstTrackIndex = 0

    /// коллекция со всеми подписками
    private var cancellableSet: Set<AnyCancellable> = []
    /// таймер
    private var timer: AnyCancellable?
    /// выбранный альбом
    private var album: AnyCancellable?

    /// штатный AudioPlayer
    private var player: AVAudioPlayer = {
        let player = AVAudioPlayer()
        return player
    }()

//    @Published var cards: [AlbumImageModel] = [
//        AlbumImageModel(image: "akustichesky", id: 0),
//        AlbumImageModel(image: "bud_kak_doma_putnik", id: 1),
//        AlbumImageModel(image: "bunt_na_korable", id: 2)
//    ]

    @Published var cards: [AlbumImageModel] = []

    @Published var currentIndex = 0

    /// input
    @Published var isPlayPause = false
    @Published var isStop = false
    @Published var isManualChangingDuration = false
    @Published var isPlayTapped = false
    @Published var isGoForwardTapped = false
    @Published var isGoBackTapped = false

    /// output
    @Published var name = ""
    @Published var imageName = ""
    @Published var currentTrackDurationPercents = 0.0
    @Published var formattedLeftTrackDuration = ""
    @Published var formattedMaxTrackDuration = ""
    @Published var isPlayerDisable = true

    @Published var isGoForwardDisable = false
    @Published var isGoBackDisable = false

    init() {
        setupBindings()
        configurePlayer()
    }

    var counter = 0 // TODO: - Удалить
}

/// Timer
private extension PlayerModel {
    private func currentDuration(_ duration: Double) -> Double {
        player.duration * (1 - currentTrackDurationPercents/100)
    }

    private func startTrackDurationTimer() {
        timer = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                counter += 1 // TODO: - Удалить
                self.currentTrackDurationPercents = self.player.currentTime / self.player.duration * 100
                self.formattedLeftTrackDuration = self.formatDuration(
                    self.currentDuration(self.currentTrackDurationPercents)
                )
                finishTrackAction()
                print(counter) // TODO: - Удалить
            }
    }

    private func stopTrackDurationTimer() {
        timer?.cancel()
        timer = nil
    }
}

/// Bindings
private extension PlayerModel {
    private var isChangeCurrentPlaybackMoment: AnyPublisher<Bool, Never> {
        $isManualChangingDuration
            .dropFirst()
            .map { [weak self] isChange in
                guard let self = self else { return false }
                if isChange == false {
                    self.startTrackDurationTimer()
                    return true
                }
                self.stopTrackDurationTimer()
                return false
            }
            .eraseToAnyPublisher()
    }
    private func setupBindings() {
        album = albumService.currentAlbum.sink { [weak self] album in
            guard let self = self else { return }
            self.arrayOfTracks = album?.album ?? []
            self.cards = []
            var counter = 0
            self.arrayOfTracks.forEach {
                self.cards.append(AlbumImageModel(image: $0.image, id: counter))
                counter += 1
            }
            self.configureCurrentTrack()
        }

        $isPlayPause
            .sink { [weak self] isPlay in
                guard let self = self else { return }
                if isPlay {
                    self.player.play()
                    self.startTrackDurationTimer()
                } else {
                    self.player.pause()
                    self.stopTrackDurationTimer()
                }
            }
            .store(in: &cancellableSet)

        $currentTrackDurationPercents
            .sink { [weak self] duration in
                guard let self = self else { return }
                self.formattedLeftTrackDuration = self.formatDuration(currentDuration(duration))
            }
            .store(in: &cancellableSet)

        isChangeCurrentPlaybackMoment
            .receive(on: RunLoop.main)
            .sink { [weak self] result in
                guard let self = self else { return }
                if result == false { return }

                if self.player.isPlaying == false {
                    self.setCurrentTime()
                    return
                }

                self.setCurrentTime()
                self.player.play()
            }
            .store(in: &cancellableSet)

        $isPlayTapped
            .dropFirst()
            .sink { [weak self] isTapped in
                guard let self = self else { return }
                isPlayPause.toggle()
            }
            .store(in: &cancellableSet)

        $isGoForwardTapped
            .sink { [weak self] isGoForward in
                guard let self = self else { return }
                self.goForward()
                currentIndex = min(currentIndex + 1, cards.count - 1)
            }
            .store(in: &cancellableSet)

        $isGoBackTapped
            .sink { [weak self] isGoBack in
                guard let self = self else { return }
                self.goBack()
                currentIndex = max(currentIndex - 1, 0)
            }
            .store(in: &cancellableSet)

        $currentIndex
            .sink { [weak self] index in
                guard let self = self else { return }
                isGoBackDisable = index <= 0  ? true : false
                isGoForwardDisable = index >= cards.count - 1 ? true : false
            }
            .store(in: &cancellableSet)

    }
}

/// Player
private extension PlayerModel {
    private func setCurrentTime() {
        player.currentTime = player.duration * currentTrackDurationPercents / 100
    }

    private func formatDuration(_ duration: TimeInterval) -> String {
        if currentTrack == nil { return "" }
        let minutes = Int(duration / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
        return String(format: "%d:%02d", minutes, seconds)
    }

    private func configurePlayer() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to create AVAudioPlayer: \(error.localizedDescription)")
        }
    }

    private func configureCurrentTrack() {
        if arrayOfTracks.isEmpty { return }
        isPlayerDisable = false
        currentIndex = 0

        currentTrack = CurrentTrack(
            currentIndex: currentIndex,
            track: arrayOfTracks[currentIndex]
        )
        player.prepareToPlay()
        preparePlay()
    }

    private func preparePlay() {
        /// контент для проигрывания
        let url = URL(
            fileURLWithPath: Bundle.main.path(
                forResource: currentTrack?.name,
                ofType: currentTrack?.type.rawValue) ?? ""
        )

        /// подсказка для CoreAudio: формат мультимедиа-файла
        switch currentTrack?.type {
        case .mp3:
            do {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            } catch let error {
                print("Failed to added contents of \(url): \(error.localizedDescription)")
            }

        case .none:
            break
        }

        name = currentTrack?.name ?? ""
        imageName = currentTrack?.image ?? ""
        currentTrackDurationPercents = player.currentTime
        formattedMaxTrackDuration = formatDuration(player.duration)
    }

    private func goForward() {
        player.stop()
        guard let index = currentTrack?.currentIndex else { return }
        if index + 1 >= arrayOfTracks.count {
            return
        } else {
            currentTrack?.currentIndex += 1
            currentTrack?.name = arrayOfTracks[currentTrack?.currentIndex ?? 0].name
            currentTrack?.type = arrayOfTracks[currentTrack?.currentIndex ?? 0].type
            preparePlay()
        }
        if isPlayPause {
            player.play()
        }
    }

    private func goBack() {
        player.stop()
        guard let index = currentTrack?.currentIndex else { return }
        if index - 1 < 0 {
            return
        } else {
            currentTrack?.currentIndex -= 1
            currentTrack?.name = arrayOfTracks[currentTrack?.currentIndex ?? 0].name
            currentTrack?.type = arrayOfTracks[currentTrack?.currentIndex ?? 0].type
            preparePlay()
        }
        if isPlayPause {
            player.play()
        }
    }

    private func finishTrackAction() {
        if self.player.isPlaying == false {
            if currentTrack?.currentIndex == arrayOfTracks.count - 1 {
                isPlayPause = false
                return
            }
            self.goForward()
        }
    }
}
