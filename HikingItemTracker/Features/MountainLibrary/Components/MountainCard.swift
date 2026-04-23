import SwiftUI

struct MountainCard: View {
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
                Text("Gunung Rinjani")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.circle.fill")
                        Text("Nusa Tenggara Barat")
                    }
                    
                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.up.circle.fill")
                            Text("3.726 mdpl")
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "arrow.up.circle.fill")
                            Text("1 Hari")
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
                Text("Grade V")
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
    MountainCard()
}
