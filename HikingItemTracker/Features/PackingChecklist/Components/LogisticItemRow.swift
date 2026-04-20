//
//  LogisticItemRow.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct LogisticItemRow: View {
    let item: LogisticItem
    let onTogglePacked: () -> Void
    let onTapDetails: () -> Void

    var body: some View {
        HStack {
            Button(action: onTogglePacked) {
                Image(systemName: item.isChecked ? "checkmark.square.fill" : "square")
                    .foregroundStyle(item.isChecked ? .green : .gray)
                    .font(.title3)
            }
            .buttonStyle(.plain)

            Button(action: onTapDetails) {
                rowContent
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
    }

    private var rowContent: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(item.name)
                        .font(.body)
                        .strikethrough(item.isChecked)
                        .foregroundStyle(item.isChecked ? .secondary : .primary)

                    if item.isEssential {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundStyle(.orange)
                            .font(.footnote)
                    }
                }

                HStack(spacing: 8) {
                    QuantityTag(text: "\(item.quantity) \(item.unit.rawValue)")

                    if item.isRented {
                        StatusTag(text: "Sewaan")
                    }
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.footnote)
        }
    }
}
