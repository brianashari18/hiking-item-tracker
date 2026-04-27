//
//  AddEditItemView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct AddEditItemView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: AddEditItemViewModel

    var onSave: ((GearItem) -> Void)?

    // MARK: - Init
    init(onSave: ((GearItem) -> Void)? = nil) {
        _viewModel = State(initialValue: AddEditItemViewModel())
        self.onSave = onSave
    }

    init(item: GearItem, onSave: ((GearItem) -> Void)? = nil) {
        _viewModel = State(initialValue: AddEditItemViewModel(item: item))
        self.onSave = onSave
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    mainInfoSection
                    categorySection
                    statusSection
                }
                .padding(20)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if let item = viewModel.buildItem() {
                            onSave?(item)
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(!viewModel.isSaveEnabled)
                }
            }
        }
    }

    // MARK: - Sections
    private var mainInfoSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            FormSectionLabel(title: "Informasi Utama")

            VStack(spacing: 14) {
                TextField("Nama Barang", text: $viewModel.name)
                    .font(.body)

                Divider()

                UnitSelectorSegmented(selectedUnit: $viewModel.selectedUnit)

                Divider()

                HStack {
                    TextField("Jumlah", text: $viewModel.quantity)
                        .keyboardType(.numberPad)
                        .font(.body)

                    Text(viewModel.selectedUnit.rawValue)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 0) {
            FormSectionLabel(title: "Kategori")

            VStack(spacing: 14) {
                HStack {
                    Text("Kategori Fungsional")
                        .font(.body)

                    Spacer()

                    Menu {
                        Picker("Kategori Fungsional", selection: $viewModel.selectedFunctionalCategory) {
                            ForEach(ItemFunctionalCategory.allCases) { cat in
                                Text(cat.rawValue).tag(cat)
                            }
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text(viewModel.selectedFunctionalCategory.rawValue)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                            Image(systemName: "chevron.up.chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .tint(.primary)
                }

                Divider()

                HStack {
                    Text("Zona Penempatan")
                        .font(.body)

                    Spacer()

                    Text(viewModel.selectedFunctionalCategory.defaultZone.rawValue)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemFill))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private var statusSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            FormSectionLabel(title: "Kepemilikan & Status")

            VStack(spacing: 14) {
                OwnershipPickerMenuButton(selectedOwnership: $viewModel.selectedOwnership)

                Divider()

                HStack {
                    Text("Barang Esensial")
                        .font(.body)

                    Spacer()

                    Toggle("", isOn: $viewModel.isEssential)
                        .tint(.green)
                        .labelsHidden()
                }

                Divider()

                HStack {
                    Text("Sudah Dipacking")
                        .font(.body)

                    Spacer()

                    Toggle("", isOn: $viewModel.isPacked)
                        .tint(.green)
                        .labelsHidden()
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview("Add Mode") {
    AddEditItemView()
}

#Preview("Edit Mode") {
    AddEditItemView(
        item: GearItem(
            name: "Beras",
            quantity: 100,
            unit: .gr,
            ownership: .kelompok,
            functionalCategory: .logisticAndFood,
            necessity: .universalEssential,
            isPacked: true
        )
    )
}
