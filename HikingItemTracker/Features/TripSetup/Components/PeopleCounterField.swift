//
//  PeopleCounterField.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct PeopleCounterField: View {
    @Binding var numberOfPeople: Int

    var body: some View {
        HStack {
            TextField("1", value: $numberOfPeople, format: .number)
                .keyboardType(.numberPad)

            Spacer()

            Stepper("", value: $numberOfPeople, in: 1...100)
                .labelsHidden()
        }
        .padding()
        .background(Color.primary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
