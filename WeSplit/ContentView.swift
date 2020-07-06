//
//  ContentView.swift
//  WeSplit
//
//  Created by Yunis Farah on 06/07/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 2

    @State private var tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount due", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<51) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentages) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }








            }
                .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

