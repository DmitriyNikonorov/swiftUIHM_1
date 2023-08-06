//
//  SettingsView.swift
//  KCSongs
//
//  Created by Дмитрий Никоноров on 05.08.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var isToggleOn = false
    @State private var sliderValue = 10.0
    @State private var selectedOption = 0
    private let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        ZStack {
            Color(.systemGray5)

            Form {
                Section {
                    Text("Section One")
                    Text("Text")
                    Toggle("Some toogle", isOn: $isToggleOn.animation())
                    if isToggleOn {
                        Text("Toggle On")
                    }
                }

                Section {
                    Text("Section Two")
                    Slider(value: $sliderValue, in: 0...100)
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(0..<3) { index in
                            Text(options[index])
                        }
                    }
                    Text("\(options[selectedOption]) is selected")
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
