//
//  TripIntroView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct TripIntroView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Text("Saatnya Memulai Pendakian\nTolong Isikan Data Pendakianmu")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.horizontal, 32)

            Spacer()

            illustrationView
                .padding(.horizontal, 48)

            Spacer()

            Button {
                router.showTripSetup()
            } label: {
                Text("Mulai Di Sini")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color.green.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 26))
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }

    private var illustrationView: some View {
        Image("img_transition")
    }
}

#Preview {
    TripIntroView()
        .environment(AppRouter())
}
