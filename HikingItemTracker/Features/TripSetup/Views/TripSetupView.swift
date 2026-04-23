import SwiftUI

struct TripSetupView: View {
    @Environment(AppRouter.self) private var router
    @State var viewModel = TripSetupViewModel()
    @State private var isSheetPresented: Bool = false
    
    init(mountain: Mountain? = nil) {
        _viewModel = State(initialValue: TripSetupViewModel(preSelectedMountain: mountain))
    }

    var body: some View {
        @Bindable var viewModel = viewModel

        ScrollView {
            VStack(spacing: 28) {
                
                VStack(alignment: .leading, spacing: 16) {
                    Image(viewModel.selectedMountain.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(viewModel.selectedMountain.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("\(viewModel.selectedMountain.location) • \(viewModel.selectedMountain.difficulty)")
                        }
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal, 30)
                }
                
                VStack(spacing: 24) {
                    TripFormSection(title: "Kapan Jadwal Pendakiannya?") {
                        TripDateRangeField(
                            startDate: $viewModel.selectedStartDate,
                            endDate: $viewModel.selectedEndDate,
                            minimumStartDate: viewModel.minimumStartDate,
                            minimumEndDate: viewModel.minimumEndDate,
                            onStartDateChange: viewModel.updateStartDate
                        )
                    }

                    TripFormSection(title: "Berapa Orang yang akan Ikut Mendaki?") {
                        PeopleCounterField(numberOfPeople: $viewModel.numberOfPeople)
                    }
                }
                .padding(.horizontal, 30)
                
            }
            .padding(.horizontal, 30)
        }
        .ignoresSafeArea(edges: .top)
        .safeAreaInset(edge: .bottom) {
            VStack {
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
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
            }
            .padding(.top, 16)
            .background(
                Rectangle()
                    .fill(.background)
                    .ignoresSafeArea(edges: .bottom)
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: -4)
            )
        }
    }
}

#Preview {
    TripSetupView()
        .environment(AppRouter())
        .environment(AppSession())
}
