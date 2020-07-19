# WeSplit
A simple check splitting app, this application is my first proper application in which I incorporated different aspects of the Swift programming language and the SwiftUI framework.

<img src="https://user-images.githubusercontent.com/64978825/86610661-9051a400-bfa5-11ea-9935-6aafdca5f329.gif"/>

## Notes
#### The calculation logic
In order to calculate the amount to pay, the computed property `totalPerson` is dependent on receiving correct information so that a suitable and correct result is returned. 
The property wrapper `@State` captures any changes to the state value and re-invokes the view, then it recomputes the body again.

```swift
    @State private var checkAmount = ""
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 2
    @State private var tipPercentages = [10, 15, 20, 25, 0]

```
This computed properties calculates the amount each individual needs to pay based on the states of the properties defined above

```swift

   var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = (orderAmount / 100) * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
```

## References
Special thanks to Paul at [Hacking with Swift](https://www.hackingwithswift.com/100/swiftui)
