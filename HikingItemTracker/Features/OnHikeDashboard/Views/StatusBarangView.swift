//
//  StatusBarangView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct StatusBarangView: View {
    @Environment(\.dismiss) private var dismiss

    let sections: [LogisticSectionModel]

    @State private var selectedCategory: ItemFunctionalCategory?

    private var allItems: [GearItem] {
        sections.flatMap(\.items)
    }

    /// Kategori yang benar-benar punya item
    private var availableCategories: [ItemFunctionalCategory] {
        ItemFunctionalCategory.allCases.filter { category in
            allItems.contains { $0.functionalCategory == category }
        }
    }

    /// Items yang ditampilkan sesuai filter kategori
    private var filteredItems: [GearItem] {
        guard let selected = selectedCategory else { return allItems }
        return allItems.filter { $0.functionalCategory == selected }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // ── 1. Total Barang ──
                HStack(spacing: 16) {
                    Image(systemName: "bag.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 48, height: 48)
                        .background(Color(red: 77/255, green: 143/255, blue: 145/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Total Perlengkapan")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text("\(allItems.count) barang")
                            .font(.title3)
                            .fontWeight(.bold)
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(Color(.systemBackground))

                Divider()

                // ── 2. Segmented Kategori ──
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        // "Semua" pill
                        CategoryPill(
                            label: "Semua",
                            icon: "square.grid.2x2",
                            count: allItems.count,
                            isSelected: selectedCategory == nil
                        ) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedCategory = nil
                            }
                        }

                        ForEach(availableCategories, id: \.self) { category in
                            let count = allItems.filter { $0.functionalCategory == category }.count
                            CategoryPill(
                                label: category.rawValue,
                                icon: category.iconName,
                                count: count,
                                isSelected: selectedCategory == category
                            ) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedCategory = category
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
                .background(Color(.systemBackground))

                Divider()

                // ── 3. List Items ──
                List {
                    ForEach(filteredItems) { item in
                        GearItemReadOnlyRow(item: item)
                    }
                }
                .listStyle(.plain)
                .animation(.easeInOut(duration: 0.25), value: selectedCategory)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Perlengkapan Dibawa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

// MARK: - Category Pill

private struct CategoryPill: View {
    let label: String
    let icon: String
    let count: Int
    let isSelected: Bool
    let action: () -> Void

    private let teal = Color(red: 77/255, green: 143/255, blue: 145/255)

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.caption)
                Text(label)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
                Text("\(count)")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(isSelected ? teal : .secondary)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
                    .background(isSelected ? Color.white : Color(.systemGray5))
                    .clipShape(Capsule())
            }
            .foregroundStyle(isSelected ? .white : .primary)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? teal : Color(.systemGray6))
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Read-only Item Row

private struct GearItemReadOnlyRow: View {
    let item: GearItem

    private let teal = Color(red: 77/255, green: 143/255, blue: 145/255)

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.functionalCategory.iconName)
                .font(.subheadline)
                .foregroundStyle(teal)
                .frame(width: 36, height: 36)
                .background(teal.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 9))

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(item.name)
                        .font(.body)

                    if item.necessity == .universalEssential {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                    }
                }

                HStack(spacing: 6) {
                    Text("×\(item.quantity)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 7)
                        .padding(.vertical, 2)
                        .background(Color.gray)
                        .clipShape(Capsule())

                    Text(item.ownership.rawValue)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(item.ownership == .pribadi ? .blue : .purple)
                        .padding(.horizontal, 7)
                        .padding(.vertical, 2)
                        .background(
                            item.ownership == .pribadi
                                ? Color.blue.opacity(0.12)
                                : Color.purple.opacity(0.12)
                        )
                        .clipShape(Capsule())
                }
            }

            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    StatusBarangView(sections: HikingTripModel.mock.sections)
}
