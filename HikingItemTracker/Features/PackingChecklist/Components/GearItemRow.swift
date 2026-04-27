//
//  GearItemRow.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct GearItemRow: View {
    let item: GearItem
    let onTogglePacked: () -> Void
    let onTapDetails: () -> Void

    var body: some View {
        HStack {
            Button(action: onTogglePacked) {
                Image(systemName: item.isPacked ? "checkmark.square.fill" : "square")
                    .foregroundStyle(item.isPacked ? .green : .gray)
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
                        .strikethrough(item.isPacked)
                        .foregroundStyle(item.isPacked ? .secondary : .primary)

                    if item.necessity == .universalEssential {
                        Image(systemName: "exclamationmark.3")
                            .foregroundStyle(.orange)
                            .font(.footnote)
                    }
                }

                HStack(spacing: 8) {
                    QuantityTag(text: "\(item.quantity) \(item.unit.rawValue)")

                    switch item.ownership {
                    case .pribadi:
                        Text(item.ownership.rawValue)
                            .font(.caption).fontWeight(.medium).foregroundStyle(.white)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(.blue.opacity(0.7)).clipShape(RoundedRectangle(cornerRadius: 10))
                    case .kelompok:
                        Text(item.ownership.rawValue)
                            .font(.caption).fontWeight(.medium).foregroundStyle(.white)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(.mint).clipShape(RoundedRectangle(cornerRadius: 10))
                    case .sewaan:
                        Text(item.ownership.rawValue)
                            .font(.caption).fontWeight(.medium).foregroundStyle(.white)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(.orange.opacity(0.7)).clipShape(RoundedRectangle(cornerRadius: 10))
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
