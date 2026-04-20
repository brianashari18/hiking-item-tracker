//
//  OnHikeDashboardView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct OnHikeDashboardView: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = OnHikeDashboardViewModel()

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 24) {
                    Text("Siap Untuk\nMelakukan Pendakian")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 24)

                    LottieView(animationName: "hiking_animation")
                        .frame(height: 280)
                        .padding(.horizontal, 20)

                    VStack(spacing: 12) {
                        CheckEquipmentButton {
                            viewModel.isStatusSheetPresented = true
                        }

                        MountainInfoCard(
                            mountain: viewModel.mountain,
                            altitudeText: viewModel.altitudeText,
                            durationText: viewModel.durationText
                        )
                    }
                    .padding(.horizontal, 20)

                    Spacer(minLength: 80)
                }
            }

            finishButton
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .sheet(isPresented: $viewModel.isStatusSheetPresented) {
            StatusBarangView(
                mountainName: viewModel.mountain.name,
                items: viewModel.filteredItems,
                progressPercentage: viewModel.progressPercentage,
                onToggleItem: viewModel.toggleItemPacked
            )
        }
        .alert("Perjalanan Selesai", isPresented: $viewModel.isFinishAlertPresented) {
            Button("Tidak", role: .cancel) {}
            Button("Yakin", role: .destructive) {
                router.showTripSetupFromFinish()
            }
        } message: {
            Text("Apakah kamu yakin ingin menyelesaikan pendakian?")
        }
    }

    private var finishButton: some View {
        Button {
            viewModel.isFinishAlertPresented = true
        } label: {
            Text("Selesai")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    OnHikeDashboardView()
        .environment(AppRouter())
}
