//
//  Mountain+Mock.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 16/04/26.
//

extension Mountain {
    static let mocks: [Mountain] = [

        // MARK: - Grade I — Sangat Mudah
        Mountain(
            name: "Gunung Bromo",
            grade: "I", location: "Jawa Timur",
            difficulty: "Sangat Mudah",
            estimatedDurationDays: 1,
            altitude: 2329,
            shortDescription: "Kaldera vulkanik ikonik dengan lautan pasir dan panorama matahari terbit yang menakjubkan.",
            trailCharacteristics: "Jalur jeep lalu trekking ringan di lautan pasir. Tidak ada tanjakan ekstrem. Cocok untuk pemula.",
            badges: ["Cocok Pemula", "1D", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "mountain.2.fill"
        ),

        // MARK: - Grade II — Mudah
        Mountain(
            name: "Gunung Ambang",
            grade: "II", location: "Sulawesi Utara",
            difficulty: "Mudah",
            estimatedDurationDays: 1,
            altitude: 1795,
            shortDescription: "Gunung berapi dengan kawah belerang dan pemandangan hijau yang asri di Sulawesi Utara.",
            trailCharacteristics: "Jalur setapak tanah basah, vegetasi lebat. Tanjakan sedang, kondisi licin saat hujan.",
            badges: ["Alam Liar", "1D"],
            isPopular: false,
            thumbnailSystemIcon: "tree.fill"
        ),
        Mountain(
            name: "Gunung Ijen",
            grade: "II", location: "Jawa Timur",
            difficulty: "Mudah",
            estimatedDurationDays: 1,
            altitude: 2386,
            shortDescription: "Surga blue fire dan danau kawah berwarna tosca paling memukau di Indonesia.",
            trailCharacteristics: "Jalur berbatu stabil, perjalanan malam menuju puncak agar menyaksikan blue fire. Perlu masker gas H2S.",
            badges: ["Blue Fire", "1D", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "flame.fill"
        ),
        Mountain(
            name: "Gunung Kaba",
            grade: "II", location: "Bengkulu",
            difficulty: "Mudah",
            estimatedDurationDays: 1,
            altitude: 1938,
            shortDescription: "Gunung berapi aktif dengan kawah lebar dan akses yang relatif mudah dari Bengkulu.",
            trailCharacteristics: "Jalur setapak tanah, beberapa bagian sudah ada tangga. Pemandangan kawah indah di puncak.",
            badges: ["Cocok Pemula", "1D"],
            isPopular: false,
            thumbnailSystemIcon: "cloud.fill"
        ),
        Mountain(
            name: "Gunung Bulubaria",
            grade: "II", location: "Sulawesi Selatan",
            difficulty: "Mudah",
            estimatedDurationDays: 2,
            altitude: 2500,
            shortDescription: "Salah satu puncak tertinggi di Sulawesi Selatan dengan hutan tropis yang rapat.",
            trailCharacteristics: "Jalur tanah berliku melewati hutan pinus dan padang rumput. Perlu camp satu malam.",
            badges: ["2D1N", "Hutan Tropis"],
            isPopular: false,
            thumbnailSystemIcon: "leaf.fill"
        ),
        Mountain(
            name: "Gunung Papandayan",
            grade: "II", location: "Jawa Barat",
            difficulty: "Mudah",
            estimatedDurationDays: 2,
            altitude: 2665,
            shortDescription: "Kawah aktif, hutan mati, dan Pondok Salada yang terkenal. Destinasi camp favorit di Jawa Barat.",
            trailCharacteristics: "Jalur berbatu melewati kawah belerang, hutan mati ghostly, dan padang edelweis. Jalur jelas.",
            badges: ["Camp Favorit", "2D1N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "smoke.fill"
        ),
        Mountain(
            name: "Gunung Batur",
            grade: "II", location: "Bali",
            difficulty: "Mudah",
            estimatedDurationDays: 1,
            altitude: 1717,
            shortDescription: "Gunung vulkanik aktif di tepi kaldera dengan sunrise paling ikonik di Bali.",
            trailCharacteristics: "Trekking malam hari, jalur berbatu dan pasir. Singkat ±2 jam. Wajib pakai guide lokal.",
            badges: ["Sunrise", "1D", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "sun.horizon.fill"
        ),
        Mountain(
            name: "Gunung Bulusaraung",
            grade: "II", location: "Sulawesi Selatan",
            difficulty: "Mudah",
            estimatedDurationDays: 1,
            altitude: 1353,
            shortDescription: "Puncak batu yang dramatis dengan pemandangan 360° di atas awan Sulawesi Selatan.",
            trailCharacteristics: "Jalur pendek tapi berbatu. Bagian puncak scrambling kecil. Pemandangan sangat memuaskan.",
            badges: ["Cocok Pemula", "1D"],
            isPopular: false,
            thumbnailSystemIcon: "binoculars.fill"
        ),
        Mountain(
            name: "Gunung Tandikat",
            grade: "II", location: "Sumatera Barat",
            difficulty: "Mudah",
            estimatedDurationDays: 2,
            altitude: 2438,
            shortDescription: "Kembar Gunung Marapi, menawarkan hutan lebat dan jalur yang lebih sepi dan natural.",
            trailCharacteristics: "Hutan heterogen lebat, jalur tanah basah. Camp di bawah puncak sebelum summit attack.",
            badges: ["2D1N", "Hutan Lebat"],
            isPopular: false,
            thumbnailSystemIcon: "tree.fill"
        ),

        // MARK: - Grade III — Sedang
        Mountain(
            name: "Gunung Merapi",
            grade: "III", location: "Jawa Tengah",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 2930,
            shortDescription: "Gunung berapi paling aktif di Indonesia. Trek malam menuju puncak Garuda yang legendaris.",
            trailCharacteristics: "Jalur berbatu terjal di atas treeline. Summit attack dini hari. Area berbahaya jika status waspada.",
            badges: ["Summit Attack", "2D1N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "exclamationmark.triangle.fill"
        ),
        Mountain(
            name: "Gunung Merbabu",
            grade: "III", location: "Jawa Tengah",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 3145,
            shortDescription: "Sabana terluas di Jawa dengan dua puncak kembar dan hamparan bunga aster yang spektakuler.",
            trailCharacteristics: "Jalur tanah dan sabana luas. Angin kencang di puncak. Beberapa jalur alternatif tersedia.",
            badges: ["Sabana Indah", "2D1N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "wind"
        ),
        Mountain(
            name: "Gunung Gede",
            grade: "III", location: "Jawa Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 2958,
            shortDescription: "Gunung di TNGP dengan kawah aktif dan hutan hujan tropis UNESCO yang kaya biodiversitas.",
            trailCharacteristics: "Jalur hutan tropis lebat, lembab, dan terjal. Checkpoint ketat. Perlu simaksi dan surat keterangan sehat.",
            badges: ["Hutan Tropis", "2D1N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "leaf.fill"
        ),
        Mountain(
            name: "Gunung Pangrango",
            grade: "III", location: "Jawa Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 3019,
            shortDescription: "Puncak tertinggi di TNGP dengan padang edelweis Alun-alun Mandalawangi yang romantis.",
            trailCharacteristics: "Jalur terjal melewati hutan heterogen. Camp di Alun-alun Mandalawangi dengan edelweis lebat.",
            badges: ["Edelweis", "2D1N"],
            isPopular: false,
            thumbnailSystemIcon: "sparkles"
        ),
        Mountain(
            name: "Gunung Tambora",
            grade: "III", location: "Nusa Tenggara Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 3,
            altitude: 2850,
            shortDescription: "Penyebab 'Tahun Tanpa Musim Panas' 1815. Kawah kaldera raksasa mencapai 6 km diameter.",
            trailCharacteristics: "Jalur panjang melewati hutan dan sabana. Kaldera membentang luar biasa di puncak. Logistik ekstra.",
            badges: ["Kaldera Raksasa", "3D2N"],
            isPopular: false,
            thumbnailSystemIcon: "circle.dotted"
        ),
        Mountain(
            name: "Gunung Ciremai",
            grade: "III", location: "Jawa Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 3078,
            shortDescription: "Puncak tertinggi di Jawa Barat. Summit attack menantang dengan jalur berbatu terjal di zona alpine.",
            trailCharacteristics: "Jalur tanah dan berbatu terjal. Angin dingin kencang di zona terbuka dekat puncak.",
            badges: ["Tertinggi Jabar", "2D1N"],
            isPopular: false,
            thumbnailSystemIcon: "flag.fill"
        ),
        Mountain(
            name: "Gunung Bawakaraeng",
            grade: "III", location: "Sulawesi Selatan",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 2833,
            shortDescription: "Gunung sakral Suku Makassar dengan padang savana luas dan udara sejuk khas Sulawesi.",
            trailCharacteristics: "Jalur panjang dan berliku. Terkenal dengan patahan Lembanna yang harus diwaspadai.",
            badges: ["Savana Luas", "2D1N"],
            isPopular: false,
            thumbnailSystemIcon: "map.fill"
        ),
        Mountain(
            name: "Gunung Singgalang",
            grade: "III", location: "Sumatera Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 2877,
            shortDescription: "Telaga Dewi di puncaknya adalah danau kawah berwarna hijau tosca yang memesona.",
            trailCharacteristics: "Hutan lebat, jalur licin saat hujan. Perlu kemampuan orientasi karena percabangan banyak.",
            badges: ["Danau Kawah", "2D1N"],
            isPopular: false,
            thumbnailSystemIcon: "drop.fill"
        ),
        Mountain(
            name: "Gunung Marapi",
            grade: "III", location: "Sumatera Barat",
            difficulty: "Sedang",
            estimatedDurationDays: 2,
            altitude: 2891,
            shortDescription: "Gunung berapi paling aktif di Sumatera. Jalur budaya Minangkabau yang kaya sejarah.",
            trailCharacteristics: "Jalur campuran hutan dan bebatuan. Status aktivitas vulkanik harus selalu dicek sebelum pendakian.",
            badges: ["Vulkanik Aktif", "2D1N"],
            isPopular: false,
            thumbnailSystemIcon: "smoke.fill"
        ),

        // MARK: - Grade IV — Sulit
        Mountain(
            name: "Gunung Semeru",
            grade: "IV", location: "Jawa Timur",
            difficulty: "Sulit",
            estimatedDurationDays: 4,
            altitude: 3676,
            shortDescription: "Atap Pulau Jawa & gunung tertinggi di Jawa. Mahameru — tujuan impian setiap pendaki Indonesia.",
            trailCharacteristics: "Jalur panjang melewati Ranu Kumbolo, Oro-oro Ombo, Kalimati. Summit attack berpasir dan terjal sangat berat.",
            badges: ["Atap Jawa", "4D3N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "star.fill"
        ),
        Mountain(
            name: "Gunung Rinjani",
            grade: "IV", location: "Nusa Tenggara Barat",
            difficulty: "Sulit",
            estimatedDurationDays: 4,
            altitude: 3726,
            shortDescription: "Puncak tertinggi kedua di Indonesia. Segara Anak, danau kawah dengan Gunung Baru Jari di tengahnya.",
            trailCharacteristics: "Trek panjang dan bervariasi. Rim kaldera menantang, descent ke Segara Anak sangat terjal. Butuh fisik prima.",
            badges: ["Atap NTB", "4D3N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "water.waves"
        ),
        Mountain(
            name: "Gunung Kerinci",
            grade: "IV", location: "Jambi",
            difficulty: "Sulit",
            estimatedDurationDays: 3,
            altitude: 3805,
            shortDescription: "Gunung berapi tertinggi di Indonesia dan tertinggi di Sumatera. Hijaunya hutan TNKS yang primeval.",
            trailCharacteristics: "Jalur panjang melewati beberapa zona vegetasi. Summit attack di atas 3000m sangat berat dan berdebu.",
            badges: ["Atap Sumatera", "3D2N", "Populer"],
            isPopular: true,
            thumbnailSystemIcon: "crown.fill"
        ),
        Mountain(
            name: "Gunung Argopuro",
            grade: "IV", location: "Jawa Timur",
            difficulty: "Sulit",
            estimatedDurationDays: 5,
            altitude: 3088,
            shortDescription: "Jalur terpanjang di Jawa. Reruntuhan Pura Dewi Rengganis dan padang savana yang luar biasa.",
            trailCharacteristics: "Trek lintas (point-to-point) 5 hari. Jarak tempuh total ±40 km. Perlu logistik besar dan tim berpengalaman.",
            badges: ["Lintas Gunung", "5D4N"],
            isPopular: false,
            thumbnailSystemIcon: "arrow.right.circle.fill"
        ),
        Mountain(
            name: "Gunung Binaiya",
            grade: "IV", location: "Maluku",
            difficulty: "Sulit",
            estimatedDurationDays: 6,
            altitude: 3027,
            shortDescription: "Atap Pulau Seram dan Kepulauan Maluku. Hutan hujan terpencil dengan keanekaragaman hayati ekstrem.",
            trailCharacteristics: "Akses sangat terbatas, perlu perahu dan porter lokal. Hutan primer lebat. Sangat ekspedisioner.",
            badges: ["Atap Maluku", "6D5N", "Ekspedisi"],
            isPopular: false,
            thumbnailSystemIcon: "globe.asia.australia.fill"
        ),
        Mountain(
            name: "Bukit Raya",
            grade: "IV", location: "Kalimantan Tengah",
            difficulty: "Sulit",
            estimatedDurationDays: 7,
            altitude: 2278,
            shortDescription: "Atap Kalimantan. Petualangan sejati menembus belantara Borneo yang masih sangat primeval.",
            trailCharacteristics: "Tidak ada jalur resmi yang jelas. Hutan hujan tropis lebat, sungai menyebrangi. Wajib porter lokal Dayak.",
            badges: ["Atap Kalimantan", "7D6N", "Ekspedisi"],
            isPopular: false,
            thumbnailSystemIcon: "safari.fill"
        ),
        Mountain(
            name: "Gandang Dewata",
            grade: "IV", location: "Sulawesi Barat",
            difficulty: "Sulit",
            estimatedDurationDays: 7,
            altitude: 3036,
            shortDescription: "Salah satu pendakian terberat di Sulawesi. Hutan lebat, tanjakan ekstrem, dan cuaca tak terduga.",
            trailCharacteristics: "Jalur sangat ekstrem, tidak ada sinyal, hutan primer padat. Wajib berpengalaman dan tim solid.",
            badges: ["7D6N", "Ekstrem", "Hutan Lebat"],
            isPopular: false,
            thumbnailSystemIcon: "xmark.shield.fill"
        ),

        // MARK: - Grade V — Sangat Sulit
        Mountain(
            name: "Gunung Leuser",
            grade: "V", location: "Aceh",
            difficulty: "Sangat Sulit",
            estimatedDurationDays: 14,
            altitude: 3404,
            shortDescription: "Jantung ekosistem TNGL, habitat orangutan, badak Sumatera. Pendakian paling melelahkan dan liar.",
            trailCharacteristics: "Ekspedisi penuh. Belantara primeval tanpa infrastruktur. Tim berpenglaman, porter, izin khusus wajib.",
            badges: ["Ekspedisi", "14D13N", "Sangat Sulit"],
            isPopular: false,
            thumbnailSystemIcon: "exclamationmark.shield.fill"
        ),
        Mountain(
            name: "Carstensz Pyramid",
            grade: "V", location: "Papua",
            difficulty: "Sangat Sulit",
            estimatedDurationDays: 10,
            altitude: 4884,
            shortDescription: "Puncak tertinggi Indonesia dan oceania. Satu dari Seven Summits dunia. Rock climbing level tinggi.",
            trailCharacteristics: "Technical rock climbing wajib. High altitude sickness menjadi risiko utama. Izin khusus & guide wajib.",
            badges: ["Seven Summits", "4884 mdpl", "Technical"],
            isPopular: false,
            thumbnailSystemIcon: "figure.climbing"
        ),
        Mountain(
            name: "Gunung Trikora",
            grade: "V", location: "Papua",
            difficulty: "Sangat Sulit",
            estimatedDurationDays: 7,
            altitude: 4750,
            shortDescription: "Puncak tertinggi ketiga di Indonesia dengan medan glasial dan tantangan aklimatisasi ekstrem.",
            trailCharacteristics: "Medan bersalju, altitude sickness serius. Perlu tim medis, aklimatisasi bertahap, dan equipment teknis.",
            badges: ["Bersalju", "7D6N", "Technical"],
            isPopular: false,
            thumbnailSystemIcon: "snowflake"
        )
    ]
}
