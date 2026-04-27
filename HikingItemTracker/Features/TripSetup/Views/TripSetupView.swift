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

        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(spacing: 28) {
                    VStack(alignment: .leading, spacing: 0) {
                        Image(viewModel.selectedMountain.imageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 280)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.selectedMountain.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.caption)
                                Text("\(viewModel.selectedMountain.location) • Grade \(viewModel.selectedMountain.grade.rawValue)")
                                    .font(.subheadline)
                            }
                            .foregroundStyle(.secondary)
                        }
                        .padding(20)
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
                    .padding(.horizontal, 20)
                    
                }
            }
            .ignoresSafeArea(edges: .top)
            
            // Back Button
            Button {
                router.showMountainLibrary()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 2)
            }
            .padding(.top, 60)
            .padding(.leading, 20)
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Button {
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "id_ID")
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let startDateStr = dateFormatter.string(from: viewModel.selectedStartDate)
                    let endDateStr = dateFormatter.string(from: viewModel.selectedEndDate)
                    
                    let tripDateStr: String
                    if Calendar.current.isDate(viewModel.selectedStartDate, inSameDayAs: viewModel.selectedEndDate) {
                        tripDateStr = startDateStr
                    } else {
                        tripDateStr = "\(startDateStr) - \(endDateStr)"
                    }

                    router.showPackingChecklist(
                        mountain: viewModel.selectedMountain,
                        tripDate: tripDateStr,
                        duration: viewModel.selectedDuration,
                        numberOfPeople: viewModel.numberOfPeople
                    )
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
