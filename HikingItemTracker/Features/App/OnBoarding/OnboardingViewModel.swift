//
//  OnboardingViewModel.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import Foundation
import Observation

struct OnboardingSlide: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let systemImageName: String
}

@Observable
final class OnboardingViewModel {
    let slides: [OnboardingSlide] = [
        OnboardingSlide(
            title: "Rencanakan Pendakianmu",
            message: "Pilih gunung, atur tanggal pendakian, dan siapkan perjalananmu dari awal dengan lebih rapi.",
            systemImageName: "mountain.2.fill"
        ),
        OnboardingSlide(
            title: "Atur Barang Bawaan",
            message: "Catat perlengkapan pribadi dan kelompok supaya tidak ada barang penting yang tertinggal.",
            systemImageName: "backpack.fill"
        ),
        OnboardingSlide(
            title: "Cek Perlengkapan",
            message: "Pantau progres packing dan pastikan semua kebutuhan sudah siap sebelum mulai perjalanan.",
            systemImageName: "checklist.checked"
        )
    ]
}
