//
//  ActiveTripCard.swift
//  HikingItemTracker
//

import SwiftUI

struct ActiveTripCard: View {
    let trip: HikingTripModel
    let onContinue: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Perjalanan Aktif")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.green)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.1))
                        .clipShape(Capsule())
                    
                    Text(trip.mountainName)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button(action: onCancel) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary.opacity(0.5))
                        .font(.title3)
                }
            }
            
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Progres Barang")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(Int(trip.progressPercentage * 100))%")
                        .font(.headline)
                        .foregroundStyle(.primary)
                }
                
                VStack(alignment: .leading) {
                    Text("Durasi")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(trip.duration) Hari")
                        .font(.headline)
                        .foregroundStyle(.primary)
                }
                
                VStack(alignment: .leading) {
                    Text("Anggota")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(trip.numberOfPeople) Orang")
                        .font(.headline)
                        .foregroundStyle(.primary)
                }
            }
            
            ProgressView(value: trip.progressPercentage)
                .tint(.green)
            
            Button(action: onContinue) {
                HStack {
                    Text("Lanjutkan Persiapan")
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.secondarySystemGroupedBackground))
                .shadow(color: .black.opacity(0.25), radius: 10, y: 5)
        )
    }
}

#Preview {
    ActiveTripCard(trip: .mock, onContinue: {}, onCancel: {})
        .padding()
        .background(Color(.systemGroupedBackground))
}
