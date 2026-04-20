//
//  TripSetupView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct TripSetupView: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = TripSetupViewModel()
    @State private var isSheetPresented: Bool = false

    var body: some View {
        @Bindable var viewModel = viewModel

        ScrollView {
            VStack(spacing: 40) {
                Text("Lengkapi Data Pendakianmu")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Image("img_mountain")
                    .frame(width: 350, height: 350)
                    .background(.primary.opacity(0.3))
                    .cornerRadius(20)
                
                VStack(spacing: 16) {
                    TripFormSection(title: "Kamu Mau Naik ke Gunung Apa?") {
                        Button {
                            isSheetPresented = true
                        } label: {
                            HStack {
                                Text(viewModel.selectedMountain.name)
                                    .foregroundStyle(.primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .background(.primary.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .buttonStyle(.plain)
                    }

                    TripFormSection(title: "Kapan Jadwal Pendakiannya?") {
                        TripDateRangeField(
                            startDate: $viewModel.selectedStartDate,
                            endDate: $viewModel.selectedEndDate,
                            minimumStartDate: viewModel.minimumStartDate,
                            minimumEndDate: viewModel.minimumEndDate,
                            onStartDateChange: viewModel.updateStartDate
                        )
                    }

                    TripFormSection(title: "Nama Kamu Siapa?") {
                        TextField("Masukkan Namamu", text: $viewModel.fullName)
                            .padding()
                            .background(.primary.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    TripFormSection(title: "Berapa Orang yang akan Ikut Mendaki?") {
                        PeopleCounterField(numberOfPeople: $viewModel.numberOfPeople)
                    }
                }
                
                Button {
                    router.showPackingChecklist()
                } label: {
                    Text("Mulai Perjalanan")
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green.opacity(viewModel.isFormValid ? 0.8 : 0.5))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .disabled(!viewModel.isFormValid)
            }
            .padding(20)
            .sheet(isPresented: $isSheetPresented) {
                MountainPickerField(
                    mountains: viewModel.mountains,
                    isSheetPresented: $isSheetPresented,
                    selectedMountain: $viewModel.selectedMountain
                )
            }
        }
    }
}

#Preview {
    TripSetupView()
        .environment(AppRouter())
        .environment(AppSession())
}
