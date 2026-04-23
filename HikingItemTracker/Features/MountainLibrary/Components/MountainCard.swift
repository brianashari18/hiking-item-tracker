import SwiftUI

struct MountainCard: View {
    let mountain: Mountain

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("img_mountain")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white.opacity(0.8))
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(mountain.name)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.circle.fill")
                        Text(mountain.location)
                    }
                    
                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.up.circle.fill")
                            Text(mountain.difficulty)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "clock.fill")
                            Text("\(mountain.duration) Hari")
                        }
                    }
                }
                .font(.caption2)
                .foregroundColor(.white.opacity(0.8))
            }
            .padding(12)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        .overlay(alignment: .topTrailing) {
            HStack(spacing: 4) {
                Image(systemName: "figure.hiking")
                Text("Grade \(mountain.grade)")
            }
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
            .foregroundColor(.white)
            .padding(12)
        }
    }
}

#Preview {
    MountainCard(mountain: Mountain(name: "Gunung Mambulilling", grade: "II", location: "Sulawesi Barat", difficulty: "Mudah", height: 2873, duration: 2, status: "Aman", fauna: "Aman", terrain: "Berlumut tebal, berkabut, licin"))
}
