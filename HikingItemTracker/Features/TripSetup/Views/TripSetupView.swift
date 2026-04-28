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
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Image(viewModel.selectedMountain.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Text("Grade \(viewModel.selectedMountain.grade.rawValue)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(viewModel.selectedMountain.grade.accentColor.opacity(0.8))
                            .clipShape(Capsule())
                        
                        Text(viewModel.selectedMountain.grade.difficulty)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Text(viewModel.selectedMountain.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.caption)
                        Text(viewModel.selectedMountain.location)
                            .font(.subheadline)
                    }
                    .foregroundStyle(.secondary)
                }
                .padding(20)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            
            List {
                
                Section {
                    DatePicker(selection: $viewModel.selectedStartDate, in: viewModel.minimumStartDate..., displayedComponents: [.date]) {
                        Text("Tanggal Naik")
                            .foregroundStyle(.primary)
                    }
                    .onChange(of: viewModel.selectedStartDate) { _, newValue in
                        viewModel.updateStartDate(newValue)
                    }

                    DatePicker(selection: $viewModel.selectedEndDate, in: viewModel.minimumEndDate..., displayedComponents: [.date]) {
                        Text("Tanggal Turun")
                            .foregroundStyle(.primary)
                    }
                } header: {
                    Text("Jadwal Pendakian")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }

                Section {
                    HStack {
                        Text("Jumlah Pendaki")
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            Button {
                                if viewModel.numberOfPeople > 1 {
                                    viewModel.numberOfPeople -= 1
                                }
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(viewModel.numberOfPeople > 1 ? viewModel.selectedMountain.grade.accentColor : .secondary.opacity(0.3))
                            }
                            .buttonStyle(.plain)
                            
                            Text("\(viewModel.numberOfPeople)")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .frame(minWidth: 24)
                            
                            Button {
                                if viewModel.numberOfPeople < 20 {
                                    viewModel.numberOfPeople += 1
                                }
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(viewModel.numberOfPeople < 20 ? viewModel.selectedMountain.grade.accentColor : .secondary.opacity(0.3))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    Text("Anggota Kelompok")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
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
                .background(viewModel.selectedMountain.grade.accentColor.opacity(viewModel.isFormValid ? 0.9 : 0.5))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .disabled(!viewModel.isFormValid)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        router.showMountainLibrary()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
        
    }
}

#Preview {
    TripSetupView()
        .environment(AppRouter())
        .environment(AppSession())
}
