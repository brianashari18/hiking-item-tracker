//
//  StatusBarangView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct StatusBarangView: View {
    @Environment(\.dismiss) private var dismiss

    let mountainName: String
    let items: [LogisticItem]
    let progressPercentage: CGFloat
    let onToggleItem: (LogisticItem) -> Void

    @State private var selectedPhase: HikePhase = .istirahat

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Picker("Phase", selection: $selectedPhase) {
                        ForEach(HikePhase.allCases) { phase in
                            Text(phase.rawValue).tag(phase)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)

                Text("Checklist Semua Barang")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)

                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(items) { item in
                            StatusBarangItemRow(
                                item: item,
                                onToggle: { onToggleItem(item) }
                            )

                            if item.id != items.last?.id {
                                Divider()
                                    .padding(.leading, 56)
                            }
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 20)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Status Barang")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    HikeProgressRing(progress: progressPercentage, size: 48)
                }
            }
        }
    }
}



private struct StatusBarangItemRow: View {
    let item: LogisticItem
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: item.isPacked ? "checkmark.square.fill" : "square")
                    .foregroundStyle(item.isPacked ? .green : Color(.systemGray3))
                    .font(.title3)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(item.name)
                        .font(.body)
                        .strikethrough(item.isPacked)
                        .foregroundStyle(item.isPacked ? .secondary : .primary)

                    if item.isEssential {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                    }
                }

                HStack(spacing: 6) {
                    QuantityTag(text: "\(item.quantity)")
                    StatusTag(text: item.ownership.rawValue)
                }
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

#Preview {
    StatusBarangView(
        mountainName: "Gunung Bromo",
        items: HikingTripModel.mock.sections.flatMap(\.items),
        progressPercentage: 0.75,
        onToggleItem: { _ in }
    )
}
