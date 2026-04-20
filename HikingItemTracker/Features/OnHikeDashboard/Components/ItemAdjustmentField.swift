//
//  MountainPickerField.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct ItemAdjustmentField: View {
    @Binding var isSheetPresented: Bool
    @Binding var itemName: String
    @Binding var itemQuantity: Int
    @Binding var isEsensial: Bool
    @Binding var isRent: Bool
    @Binding var isPacked: Bool
    
    var body: some View {
        NavigationStack() {
            List {
                Section("Informasi Utama") {
                    TextField("Masukkan nama barang", text: $itemName)
                    
                    Stepper("Kuantitas: \(itemQuantity)", value: $itemQuantity, in: 0...100)
                }
                
                Section("Barang & Status") {
                    Toggle("Barang Esensial", isOn: $isEsensial)
                    Toggle("Barang Sewaan", isOn: $isRent)
                    Toggle("Sudah Dipacking", isOn: $isPacked)
                }
            }
            .navigationTitle("Edit Barangmu Di Sini")
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Simpan") {
                        isSheetPresented = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isSheetPresented = false
                    } label: {
                        Text("Kembali")
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    ItemAdjustmentField(isSheetPresented: .constant(false), itemName: .constant("Tenda"), itemQuantity: .constant(1), isEsensial: .constant(false), isRent: .constant(false), isPacked: .constant(false))
}
