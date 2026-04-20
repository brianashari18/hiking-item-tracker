//
//  TripDateRangeField.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct TripDateRangeField: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    let minimumStartDate: Date
    let minimumEndDate: Date
    let onStartDateChange: (Date) -> Void

    var body: some View {
        HStack {
            dateColumn(
                title: "Tanggal Naik",
                selection: $startDate,
                dateRange: minimumStartDate...
            )

            Spacer()

            dateColumn(
                title: "Tanggal Turun",
                selection: $endDate,
                dateRange: minimumEndDate...
            )
        }
        .onChange(of: startDate) { _, newValue in
            onStartDateChange(newValue)
        }
    }

    private func dateColumn(
        title: String,
        selection: Binding<Date>,
        dateRange: PartialRangeFrom<Date>
    ) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack {
                Image(systemName: "calendar")
                DatePicker(
                    "",
                    selection: selection,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.compact)
                .labelsHidden()
            }
        }
    }
}
