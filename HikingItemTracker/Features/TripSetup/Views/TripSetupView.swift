//
//  TripSetupView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct TripSetupView: View {
    @Environment(AppRouter.self) private var router
    @Environment(AppSession.self) private var session

    // Inisialisasi dengan mountain pertama dari mock sebagai placeholder aman.
    // Nilai real dari session.selectedMountain akan diinjeksi di .onAppear.
    @State private var viewModel = TripSetupViewModel(selectedMountain: Mountain.mocks[0])

    var body: some View {
        @Bindable var vm = viewModel

        ScrollView {
            VStack(spacing: 28) {

                // MARK: - Header
                VStack(spacing: 6) {
                    Text("Lengkapi Data Pendakianmu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("Satu langkah lagi sebelum checklist-mu siap!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 8)

                // MARK: - Mountain Summary Card (read-only)
                selectedMountainCard(viewModel.selectedMountain)

                // MARK: - Form Fields
                VStack(spacing: 16) {

                    TripFormSection(title: "Kapan Jadwal Pendakiannya?") {
                        TripDateRangeField(
                            startDate: $vm.selectedStartDate,
                            endDate: $vm.selectedEndDate,
                            minimumStartDate: viewModel.minimumStartDate,
                            minimumEndDate: viewModel.minimumEndDate,
                            onStartDateChange: viewModel.updateStartDate
                        )
                    }

                    TripFormSection(title: "Nama Kamu Siapa?") {
                        TextField("Masukkan Namamu", text: $vm.fullName)
                            .padding()
                            .background(.primary.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    TripFormSection(title: "Berapa Orang yang akan Ikut Mendaki?") {
                        PeopleCounterField(numberOfPeople: $vm.numberOfPeople)
                    }
                }

                // MARK: - CTA
                Button {
                    session.tripSetupData = viewModel.buildTripSetupData()
                    router.showPackingChecklist()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "checklist")
                            .font(.headline)
                        Text("Mulai Perjalanan")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(
                        viewModel.isFormValid
                            ? AnyShapeStyle(LinearGradient(
                                colors: [
                                    Color(hue: 0.38, saturation: 0.75, brightness: 0.58),
                                    Color(hue: 0.42, saturation: 0.70, brightness: 0.48)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                              ))
                            : AnyShapeStyle(Color(.systemGray4))
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 27))
                    .shadow(
                        color: viewModel.isFormValid
                            ? Color(hue: 0.40, saturation: 0.7, brightness: 0.5).opacity(0.4)
                            : .clear,
                        radius: 12, y: 4
                    )
                }
                .buttonStyle(.plain)
                .disabled(!viewModel.isFormValid)
                .padding(.bottom, 32)
            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            // Inject mountain real dari AppSession saat view muncul.
            // Selalu sinkronkan agar perubahan di library langsung terefleksi.
            if let mountain = session.selectedMountain {
                viewModel = TripSetupViewModel(selectedMountain: mountain)
            }
        }
    }

    // MARK: - Selected Mountain Card

    @ViewBuilder
    private func selectedMountainCard(_ mountain: Mountain) -> some View {
        HStack(spacing: 14) {
            // Gradient icon
            ZStack {
                gradeGradient(for: mountain.grade)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 56, height: 56)

                Image(systemName: mountain.thumbnailSystemIcon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.9))
            }

            // Info column
            VStack(alignment: .leading, spacing: 3) {
                Text(mountain.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Label(mountain.location, systemImage: "mappin.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack(spacing: 8) {
                    Label(mountain.altitudeFormatted, systemImage: "arrow.up.circle.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Label("\(mountain.estimatedDurationDays) hari", systemImage: "clock.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            // Confirmed checkmark
            Image(systemName: "checkmark.circle.fill")
                .font(.title3)
                .foregroundStyle(Color(hue: 0.40, saturation: 0.65, brightness: 0.55))
        }
        .padding(14)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(
                    Color(hue: 0.40, saturation: 0.5, brightness: 0.6).opacity(0.3),
                    lineWidth: 1
                )
        )
    }

    private func gradeGradient(for grade: String) -> LinearGradient {
        switch grade {
        case "I":
            return LinearGradient(
                colors: [Color(hue:0.42,saturation:0.6,brightness:0.75), Color(hue:0.48,saturation:0.55,brightness:0.65)],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        case "II":
            return LinearGradient(
                colors: [Color(hue:0.55,saturation:0.65,brightness:0.75), Color(hue:0.60,saturation:0.70,brightness:0.60)],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        case "III":
            return LinearGradient(
                colors: [Color(hue:0.10,saturation:0.70,brightness:0.85), Color(hue:0.06,saturation:0.75,brightness:0.70)],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        case "IV":
            return LinearGradient(
                colors: [Color(hue:0.03,saturation:0.80,brightness:0.80), Color(hue:0.00,saturation:0.85,brightness:0.60)],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        default: // Grade V
            return LinearGradient(
                colors: [Color(hue:0.78,saturation:0.60,brightness:0.55), Color(hue:0.75,saturation:0.70,brightness:0.35)],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

#Preview {
    TripSetupView()
        .environment(AppRouter())
        .environment(AppSession.preview)
}
