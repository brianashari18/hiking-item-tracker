//
//  MountainMock.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

extension Mountain {
    static let mocks: [Mountain] = [
        Mountain(name: "Gunung Bromo", grade: "I", location: "Jawa Timur", difficulty: "Sangat Mudah", height: 2329, duration: 1, status: "Waspada", fauna: "Ada tapi tidak berbahaya, jauh dari keramaian", terrain: "Sangat mudah diakses", imageUrl: "gunung_bromo"),
        
        Mountain(name: "Gunung Ambang", grade: "II", location: "Sulawesi Utara", difficulty: "Mudah", height: 1795, duration: 2, status: "Level I (Normal)", fauna: "Macaca Nigra (Yaki)", terrain: "Gas beracun", imageUrl: "gunung_ambang"),
        
        Mountain(name: "Gunung Ijen", grade: "II", location: "Jawa Timur", difficulty: "Mudah", height: 2769, duration: 1, status: "Level I (Normal)", fauna: "Ada macan, tapi jauh dari jalur pendakian", terrain: "Tanah merah, berpasir, dan berbatu licin. Terdapat jurang", imageUrl: "gunung_ijen"),
        
        Mountain(name: "Gunung Kaba", grade: "II", location: "Bengkulu", difficulty: "Mudah", height: 1952, duration: 2, status: "Level I (Normal)", fauna: "Owa siamang", terrain: "Trek mudah dan jarak tempuh singkat", imageUrl: "gunung_kaba"),
        
        Mountain(name: "Gunung Bulubaria", grade: "II", location: "Sulawesi Selatan", difficulty: "Mudah", height: 2730, duration: 2, status: "Aman", fauna: "Aman", terrain: "Cukup sulit", imageUrl: "gunung_bulubaria"),
        
        Mountain(name: "Gunung Mambulilling", grade: "II", location: "Sulawesi Barat", difficulty: "Mudah", height: 2873, duration: 2, status: "Aman", fauna: "Aman", terrain: "Berlumut tebal, berkabut, licin", imageUrl: "gunung_mambuliling"),
        
        Mountain(name: "Gunung Papandayan", grade: "II", location: "Jawa Barat", difficulty: "Mudah", height: 2665, duration: 2, status: "Level I (Normal)", fauna: "Aman", terrain: "Jalur landai, tertata, dan tidak terlalu curam", imageUrl: "gunung_papandayan"),
        
        Mountain(name: "Gunung Bulusaraung", grade: "II", location: "Sulawesi Selatan", difficulty: "Mudah", height: 1353, duration: 2, status: "Aman", fauna: "Banyak kupu-kupu", terrain: "Bebatuan dengan medan cukup terjal", imageUrl: "gunung_bulusaraung"),
        
        Mountain(name: "Gunung Batur", grade: "II", location: "Bali", difficulty: "Mudah", height: 1717, duration: 1, status: "Level II (Waspada)", fauna: "Monyet ekor panjang", terrain: "Tanah berpasir dan batuan vulkanik", imageUrl: "gunung_batur"),
        
        Mountain(name: "Gunung Maras", grade: "II", location: "Bangka Belitung", difficulty: "Mudah", height: 669, duration: 2, status: "Aman", fauna: "Aman, jauh dari keramaian", terrain: "Tanah dengan medan cukup terjal", imageUrl: "gunung_maras"),
        
        Mountain(name: "Gunung Kelimutu", grade: "III", location: "Nusa Tenggara Timur", difficulty: "Sedang", height: 1639, duration: 1, status: "Level I (Normal)", fauna: "Aman", terrain: "Jalan setapak rapi, tangga semen, pagar pembatas aman", imageUrl: "gunung_kelimutu"),
        
        Mountain(name: "Gunung Ciremai", grade: "III", location: "Jawa Barat", difficulty: "Sedang", height: 3078, duration: 3, status: "Level I (Normal)", fauna: "Babi hutan di pos 6", terrain: "Terjal, minim air", imageUrl: "gunung_ciremai"),
        
        Mountain(name: "Gunung Bawakaraeng", grade: "III", location: "Sulawesi Selatan", difficulty: "Sedang", height: 2830, duration: 3, status: "Non Aktif", fauna: "Babi hutan", terrain: "Terjal, hutan lumut licin, suhu rendah", imageUrl: "gunung_bawakaraeng"),
        
        Mountain(name: "Gunung Pangrango", grade: "III", location: "Jawa Barat", difficulty: "Sedang", height: 3026, duration: 2, status: "Non Aktif", fauna: "Macan tutul", terrain: "Tanah berbatu, suhu sangat rendah, sering hujan", imageUrl: "gunung_pangrango"),
        
        Mountain(name: "Gunung Gede", grade: "III", location: "Jawa Barat", difficulty: "Sedang", height: 2958, duration: 2, status: "Level I (Normal)", fauna: "Macan tutul", terrain: "Berbatu, berakar, sering hujan", imageUrl: "gunung_gede"),
        
        Mountain(name: "Gunung Halimun Salak", grade: "III", location: "Jawa Barat", difficulty: "Sedang", height: 1929, duration: 3, status: "Non Aktif", fauna: "Macan tutul Jawa, biawak, ular", terrain: "Hutan hujan tropis rapat, lembap, berkabut", imageUrl: "gunung_halimunsalak"),
        
        Mountain(name: "Gunung Merbabu", grade: "III", location: "Jawa Tengah", difficulty: "Sedang", height: 3145, duration: 2, status: "Non Aktif", fauna: "Elang Jawa", terrain: "Didominasi batuan besar", imageUrl: "gunung_merbabu"),
        
        Mountain(name: "Gunung Nokilalaki", grade: "III", location: "Sulawesi Tengah", difficulty: "Sedang", height: 2357, duration: 2, status: "Non Aktif", fauna: "Anoa, maleo, tarsius", terrain: "Terjal menanjak, vegetasi rapat, cuaca tidak menentu", imageUrl: "gunung_nokilalaki"),
        
        Mountain(name: "Gunung Masurai", grade: "III", location: "Jambi", difficulty: "Sedang", height: 2916, duration: 4, status: "Non Aktif", fauna: "Harimau Sumatra", terrain: "Ekstrem, lebat, lembap, akar pohon, tanjakan curam", imageUrl: "gunung_masurai"),
        
        Mountain(name: "Gunung Tujuh", grade: "III", location: "Jambi", difficulty: "Sedang", height: 2732, duration: 2, status: "Non Aktif", fauna: "Harimau Sumatra", terrain: "Hutan hujan tropis lebat", imageUrl: "danau_gunung_tujuh_kerinci"),
        
        Mountain(name: "Gunung Kelam", grade: "III", location: "Kalimantan Barat", difficulty: "Sedang", height: 1002, duration: 1, status: "Non Aktif", fauna: "Beruang madu", terrain: "Dinding batu curam", imageUrl: "gunung_kelam"),
        
        Mountain(name: "Gunung Kerinci", grade: "IV", location: "Jambi", difficulty: "Sulit", height: 3805, duration: 3, status: "Aktif", fauna: "Harimau Sumatra", terrain: "Hutan lebat, berlumpur licin, tanjakan curam, pasir vulkanik", imageUrl: "gunung_kerinci"),
        
        Mountain(name: "Gunung Argopuro", grade: "IV", location: "Jawa Timur", difficulty: "Sulit", height: 3088, duration: 5, status: "Non Aktif", fauna: "Merak, elang", terrain: "Jalur sangat panjang, vegetasi padat", imageUrl: "gunung_argopuro"),
        
        Mountain(name: "Bukit Raya", grade: "IV", location: "Kalimantan Tengah", difficulty: "Sulit", height: 2278, duration: 7, status: "Non Aktif", fauna: "Orang utan, beruang madu, macan dahan", terrain: "Hutan hujan tropis lembap", imageUrl: "gunung_bukit_raya"),
        
        Mountain(name: "Gandang Dewata", grade: "IV", location: "Sulawesi Barat", difficulty: "Sulit", height: 3037, duration: 10, status: "Non Aktif", fauna: "Satwa endemik", terrain: "Jalur sempit licin, sangat terjal", imageUrl: "gunung_gandang_dewata"),
        
        Mountain(name: "Gunung Binaiya", grade: "IV", location: "Maluku", difficulty: "Sulit", height: 3027, duration: 11, status: "Non Aktif", fauna: "Burung nuri bayan, kasturi", terrain: "Didominasi bebatuan keras", imageUrl: "gunung_binaiya"),
        
        Mountain(name: "Gunung Rinjani", grade: "IV", location: "Nusa Tenggara Barat", difficulty: "Sulit", height: 3726, duration: 4, status: "Aktif", fauna: "Monyet, elang flores", terrain: "Terjal, puncak didominasi pasir dan kerikil vulkanik", imageUrl: "gunung_rinjani"),
        
        Mountain(name: "Gunung Leuser", grade: "V", location: "Aceh", difficulty: "Sangat Sulit", height: 3466, duration: 14, status: "Non Aktif", fauna: "Burung kucica ekor kuning", terrain: "Hutan hujan tropis perawan padat, terjal, berakar, berlumpur", imageUrl: "gunung_leuser"),
        
        Mountain(name: "Carstensz Pyramid", grade: "V", location: "Papua", difficulty: "Sangat Sulit", height: 4884, duration: 14, status: "Kritis", fauna: "Dingo", terrain: "Tebing batu kapur vertikal licin, suhu di bawah 0C, medan teknis", imageUrl: "gunung_carstensz_pyramid"),
        
        Mountain(name: "Gunung Trikora", grade: "V", location: "Papua", difficulty: "Sangat Sulit", height: 4751, duration: 10, status: "Non Aktif", fauna: "Puyuh salju, bebek liar", terrain: "Panjat tebing, hutan tanah gembur, kabut", imageUrl: "gunung_trikora")
    ]
}
