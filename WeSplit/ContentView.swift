//
//  ContentView.swift
//  WeSplit
//
//  Created by Yunis Farah on 06/07/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//
//  This project was an introduction to SwiftUI and app building
//
//
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 2

    @State private var tipPercentages = [10, 15, 20, 25, 0]

    /**
     This computed property calculates the amount each individual needs to pay based the states of the properties define above
     */
   var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = ( orderAmount / 100 ) * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount due", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerson, specifier: "%.2f")")
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

