# Navigasi Wisata (`navigasi_wisata`)

Aplikasi Flutter sederhana bertema **"Menu Wisata Indonesia"** yang menerapkan konsep *routing* dan *navigasi antarhalaman* (Tugas Sesi #9 — Mobile Programming).

## Fitur Utama
- **Halaman Beranda (`Wisata Indonesia`):** Menampilkan 4 menu kategori utama (**Pantai**, **Gunung**, **Budaya**, dan **Kuliner**) menggunakan `GridView.count` dengan 2 kolom.
- **Halaman Kategori Menu:** Menampilkan `AppBar`, ikon pendukung, nama wisata/budaya/kuliner, deskripsi singkat, serta tombol kembali.
- **Halaman Detail Wisata:** Menerima dan menampilkan data berupa **nama tempat wisata** yang dikirim melalui parameter rute dari tombol **"Lihat Detail"** pada halaman kategori.
- **Routing & Navigasi:** Menggunakan `MaterialApp` (`initialRoute` dan `routes`), `Navigator.pushNamed()` untuk berpindah halaman, `ModalRoute` untuk menerima parameter, dan `Navigator.pop()` untuk kembali ke halaman sebelumnya.

## Daftar Route Aplikasi
| Route | Halaman | Keterangan |
| :--- | :--- | :--- |
| `'/'` | `HomePage` | Halaman beranda aplikasi ("Wisata Indonesia") |
| `'/pantai'` | `MenuPage` (Pantai) | Informasi Pantai Kuta & tombol "Lihat Detail" |
| `'/gunung'` | `MenuPage` (Gunung) | Informasi Gunung Bromo |
| `'/budaya'` | `MenuPage` (Budaya) | Informasi Tari Kecak |
| `'/kuliner'` | `MenuPage` (Kuliner) | Informasi Rendang Padang |
| `'/detail'` | `DetailWisataPage` | Menampilkan detail nama tempat wisata dari parameter |

## Widget Utama yang Digunakan
- `Scaffold` & `AppBar`
- `GridView.count`
- `Container`, `Column`, `Row`, `Text`, `Icon`, `ElevatedButton`, dan `Card`

## Cara Menjalankan Proyek
1. Masuk ke direktori proyek:
   ```bash
   cd navigasi_wisata
   ```
2. Ambil dependensi paket:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi di perangkat atau emulator:
   ```bash
   flutter run
   ```
