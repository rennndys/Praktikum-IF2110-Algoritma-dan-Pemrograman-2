# Notasi Fungsional dan Ekspresi Dasar — Latihan Praktikum

Latihan praktikum Algoritma dan Pemrograman 2 menggunakan Haskell.

> Soal disusun berdasarkan halaman latihan praktikum yang diunggah.

## Soal 1 — Halo, Praktikum!

**Nama File:** `HaloPraktikum.hs`

**Header:** `module HaloPraktikum where`

Selamat datang di praktikum Algoritma dan Pemrograman 2. Soal pertama ini memastikan kamu sudah dapat membuat file Haskell dan mengumpulkannya ke Olympia.

Lengkapi realisasi `salam` agar menghasilkan teks `Halo, Praktikum!`.

**Definisi dan Spesifikasi:**

```haskell
salam :: String
-- salam adalah pesan pembuka praktikum
```

**Contoh Aplikasi:**

```haskell
> salam
"Halo, Praktikum!"
```

Pastikan nama file, nama modul, indentasi, huruf kapital, spasi, dan tanda baca sudah benar.

Implementasikan bagian **REALISASI** pada file `HaloPraktikum.hs` yang diberikan.

**Tips:** Jalankan `ghci HaloPraktikum.hs`, lalu ketik `salam` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 2 — Kembali ke Nangor Falls

**Nama File:** `KodeJurnal.hs`

**Header:** `module KodeJurnal where`

Petualangan Dipper di Nangor Falls berlanjut setelah Algoritma dan Pemrograman 1. Di dalam Jurnal 3, ia menemukan sebuah catatan lama: suatu bilangan `n` diubah menjadi kode dengan menghitung pangkat tiganya.

Bantulah Dipper membuat fungsi `kodeJurnal` yang menerima sebuah bilangan bulat `n` dan menghasilkan `n × n × n`.

**Definisi dan Spesifikasi:**

```haskell
kodeJurnal :: Int -> Int
-- kodeJurnal n menghasilkan pangkat tiga dari n
```

**Batasan:**

- `-1000 ≤ n ≤ 1000`

**Contoh Aplikasi:**

```haskell
> kodeJurnal 3
27

> kodeJurnal (-2)
-8
```

Implementasikan bagian **REALISASI** pada file `KodeJurnal.hs` yang diberikan.

**Tips:** Jalankan `ghci KodeJurnal.hs`, lalu ketik `kodeJurnal 3` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 3 — Koin Mystery Shack

**Nama File:** `KoinMysteryShack.hs`

**Header:** `module KoinMysteryShack where`

Paman Stan menemukan sekotak uang receh di bawah meja kasir Mystery Shack. Ia meminta Dipper menghitung nilainya sebelum toko dibuka.

Koin yang ditemukan terdiri atas:

- quarter , senilai 25 sen;
- dime , senilai 10 sen;
- nickel , senilai 5 sen; dan
- penny , senilai 1 sen.

Buatlah fungsi `hitungKoin` yang menerima banyaknya masing-masing koin dan menghasilkan pasangan `(dollar, sen)`. Satu dollar bernilai 100 sen dan komponen sen pada hasil harus berada pada rentang 0 sampai 99.

**Definisi dan Spesifikasi:**

```haskell
hitungKoin :: Int -> Int -> Int -> Int -> (Int, Int)
-- hitungKoin quarter dime nickel penny menghasilkan pasangan
-- (dollar, sen) yang senilai dengan seluruh koin
```

**Batasan:**

- `0 ≤ quarter, dime, nickel, penny ≤ 1.000.000`

**Contoh Aplikasi:**

```haskell
> hitungKoin 8 20 30 77
(6,27)

> hitungKoin 3 2 1 4
(1,4)
```

Implementasikan bagian **REALISASI** pada file `KoinMysteryShack.hs` yang diberikan.

**Petunjuk:** Hitung seluruh nilai koin dalam sen terlebih dahulu. Gunakan `div` untuk memperoleh dollar dan `mod` untuk memperoleh sisa sen.

**Tips:** Jalankan `ghci KoinMysteryShack.hs`, lalu ketik `hitungKoin 8 20 30 77` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 4 — Pembaca Anomali

**Nama File:** `PembacaAnomali.hs`

**Header:** `module PembacaAnomali where`

Dipper sedang menguji alat pembaca anomali di hutan Nangor Falls. Alat tersebut mengambil empat pengukuran. Karena gangguan, satu nilai dapat terlalu tinggi dan satu nilai dapat terlalu rendah.

Untuk memperoleh skor yang lebih stabil, Dipper mengabaikan satu nilai terbesar dan satu nilai terkecil, lalu menghitung rata-rata dari dua nilai yang tersisa. Jika ada nilai yang sama, tetap hanya satu nilai terbesar dan satu nilai terkecil yang diabaikan.

Buatlah fungsi `skorAnomali` yang melakukan perhitungan tersebut.

**Definisi dan Spesifikasi:**

```haskell
skorAnomali :: Int -> Int -> Int -> Int -> Float
-- skorAnomali a b c d menghasilkan rata-rata dua nilai tengah
-- setelah satu nilai terbesar dan satu nilai terkecil diabaikan
```

**Batasan:**

- `1 ≤ a, b, c, d ≤ 1.000.000`

**Contoh Aplikasi:**

```haskell
> skorAnomali 7 9 6 9
8.0

> skorAnomali 1 2 3 4
2.5
```

Kerjakan menggunakan ekspresi dasar, fungsi antara, dan nama lokal `let ... in`. Jangan gunakan ekspresi kondisional, *guard*, list, atau pengurutan.

Implementasikan bagian **REALISASI** pada file `PembacaAnomali.hs` yang diberikan.

**Petunjuk:**

- Nil`a`i ter`b`esar dari a dan b dapat dihitung dengan `div (a + b + abs (a - b)) 2` .
- Definisikan fungsi antara untuk nilai terbesar dan terkecil dari dua serta empat bilangan.
- Gunakan `from`Int`egral` sebelum membagi sebuah Int menjadi hasil `Float` .

**Tips:** Jalankan `ghci PembacaAnomali.hs`, lalu ketik `skorAnomali 7 9 6 9` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 5 — Sandi Jurnal

**Nama File:** `SandiJurnal.hs`

**Header:** `module SandiJurnal where`

Dipper menemukan halaman Jurnal 3 yang disegel dengan sebuah sandi bilangan bulat. Segel hanya terbuka jika sandi memenuhi seluruh aturan berikut:

1. sandi terdiri dari tepat tiga digit;
2. digit pertama sama dengan digit terakhir;
3. digit tengah berbeda dari digit pertama; dan
4. jumlah ketiga digit habis dibagi tiga.

Buatlah predikat `isSandiValid` yang menentukan apakah sebuah sandi valid.

**Definisi dan Spesifikasi:**

```haskell
isSandiValid :: Int -> Bool
-- isSandiValid sandi benar jika sandi memenuhi seluruh aturan segel
```

**Batasan:**

- `0 ≤ sandi ≤ 9999`

**Contoh Aplikasi:**

```haskell
> isSandiValid 252
True

> isSandiValid 232
False

> isSandiValid 99
False
```

Gunakan ekspresi dasar dan operator Boolean. Jangan gunakan `if`, *guard*, list, atau rekursi.

Implementasikan bagian **REALISASI** pada file `SandiJurnal.hs` yang diberikan.

**Petunjuk:**

- Gunakan `div` dan `mod` untuk mengambil setiap digit.
- Gunakan `&&` untuk menggabungkan syarat-syarat yang semuanya harus benar.

**Tips:** Jalankan `ghci SandiJurnal.hs`, lalu ketik `isSandiValid 252` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.
