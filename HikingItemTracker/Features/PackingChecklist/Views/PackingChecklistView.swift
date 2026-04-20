//
//  PackingChecklistView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistView: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = PackingChecklistViewModel()
    @State private var showCompactTitle = false

    private let compactTitleThreshold: CGFloat = -36

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    GeometryReader { proxy in
                        Color.clear
                            .preference(
                                key: PackingChecklistScrollOffsetKey.self,
                                value: proxy.frame(in: .named("packingChecklistScroll")).minY
                            )
                    }
                    .frame(height: 0)

                    if !showCompactTitle {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.tripDate)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .transition(.opacity)
                    }

                    PackingChecklistProgressCard(percentage: viewModel.progressPercentage)

                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.displayedSections) { section in
                            LogisticSectionView(
                                sectionData: section,
                                onTogglePacked: viewModel.togglePackedState,
                                onTapItem: viewModel.selectItem,
                                onDeleteItem: viewModel.deleteItem
                            )
                        }
                    }

                    Spacer()
                }
                .padding(20)
            }
            .coordinateSpace(name: "packingChecklistScroll")
            .onPreferenceChange(PackingChecklistScrollOffsetKey.self) { offset in
                withAnimation(.easeInOut(duration: 0.2)) {
                    showCompactTitle = offset < compactTitleThreshold
                }
            }
            .safeAreaInset(edge: .bottom) {
                BottomActionButton(
                    title: viewModel.progressPercentage < 1.0
                        ? "Lengkapi Barangmu Dulu"
                        : "Mulai Pendakian",
                    action: viewModel.progressPercentage >= 1.0
                        ? { router.showOnHikeDashboard() }
                        : nil
                )
            }
            .navigationTitle(viewModel.mountainName)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    PackingChecklistOptionsMenuButton(
                        groupingMode: $viewModel.groupingMode,
                        onAddItem: { viewModel.isAddSheetPresented = true }
                    )
                }

                if showCompactTitle {
                    ToolbarItem(placement: .principal) {
                        VStack(spacing: 0) {
                            

                            Text(viewModel.tripDate)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 2)
                    }
                }
            }
            .sheet(item: $viewModel.selectedItem) { item in
                AddEditItemView(item: item, onSave: viewModel.updateItem)
            }
            .sheet(isPresented: $viewModel.isAddSheetPresented) {
                AddEditItemView(onSave: viewModel.addItem)
            }
        }
    }
}

private struct PackingChecklistScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    PackingChecklistView()
}
