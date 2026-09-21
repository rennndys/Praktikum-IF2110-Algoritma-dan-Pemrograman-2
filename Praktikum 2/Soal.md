# Ekspresi Kondisional dan Tipe Bentukan — Latihan Praktikum

Latihan praktikum Algoritma dan Pemrograman 2 menggunakan Haskell.

> Soal disusun berdasarkan halaman latihan praktikum yang diunggah.

## Soal 1 — Gedung Terlihat

**Nama File:** `GedungTerlihat.hs`

**Header:** `module GedungTerlihat where`

Seorang pengamat berdiri dengan tinggi tertentu dan ingin mengetahui apakah sebuah gedung dapat terlihat dari posisinya. Gedung akan terlihat jika tingginya lebih dari tinggi pengamat. Jika tinggi gedung sama dengan atau lebih rendah dari tinggi pengamat,
    maka gedung tidak terlihat.

Bantulah pengamat dengan membuat fungsi `gedungTerlihat` yang menerima dua parameter: tinggi pengamat `x` dan tinggi gedung `y`. Fungsi ini harus mengembalikan string `"Terlihat"` atau `"Tidak terlihat"`    berdasarkan perbandingan kedua tinggi tersebut.

**Definisi dan Spesifikasi:**

```haskell
gedungTerlihat :: Int -> Int -> String
-- gedungTerlihat x y menentukan apakah gedung dengan tinggi y terlihat dari pengamat dengan tinggi x
```

**Batasan:**

- `0 ≤ x ≤ 10000` (tinggi pengamat)
- `0 ≤ y ≤ 10000` (tinggi gedung)

**Logika:**

- Jika `x >= y`, kembalikan `"Tidak terlihat"`
- Jika `x < y`, kembalikan `"Terlihat"`

**Contoh Aplikasi:**

```haskell
> gedungTerlihat 10 5
"Tidak terlihat"

> gedungTerlihat 5 10
"Terlihat"

> gedungTerlihat 10 10
"Tidak terlihat"
```

Implementasikan bagian **REALISASI** pada file `GedungTerlihat.hs` yang diberikan. Ganti `undefined` dengan realisasimu.

**Tips:** Jalankan `ghci GedungTerlihat.hs`, lalu ketik `gedungTerlihat 10 5` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 2 — Bilangan Bulat

**Nama File:** `BilanganBulat.hs`

**Header:** `module BilanganBulat where`

Dalam aplikasi pemrosesan bilangan, kita perlu menentukan apakah suatu bilangan merupakan kelipatan dari bilangan lain. Namun, pengecekan ini hanya berlaku jika kondisi tertentu dari helper function terpenuhi. Jika kondisi tidak terpenuhi, operasi dianggap tidak mungkin dilakukan.

Implementasikan fungsi `func1` yang menerima dua parameter `x` (pembagi) dan `y` (bilangan yang dicek), serta helper function `func2` yang menentukan apakah operasi dapat dilakukan. Fungsi `func1` harus mengembalikan string: `"bulat"`, `"tidak bulat"`, atau `"tidak mungkin"`.

**Definisi dan Spesifikasi:**

```haskell
func2 :: Int -> Int
-- func2 x menghasilkan x - 5

func1 :: Int -> Int -> String
-- func1 x y menentukan apakah y adalah kelipatan x, bergantung pada func2(x)
```

**Batasan:**

- `1 ≤ x ≤ 1000` (pembagi)
- `-1000 ≤ y ≤ 1000` (bilangan yang dicek)

**Logika:**

```haskell
Jika func2(x) > 0:
    Jika y mod x == 0, kembalikan "bulat"
    Jika y mod x > 0, kembalikan "tidak bulat"
Jika func2(x) <= 0:
    Kembalikan "tidak mungkin"
```

**Catatan:** Implementasikan `func2` sebagai fungsi helper yang mengembalikan `x - 5`.

**Contoh Aplikasi (dengan func2 x = x - 5):**

```haskell
> func1 10 20
"bulat"

> func1 10 25
"tidak bulat"

> func1 3 0
"tidak mungkin"

> func1 5 15
"tidak mungkin"
```

Implementasikan `func2` dan `func1` pada bagian **REALISASI** di file `BilanganBulat.hs` yang diberikan.

**Tips:** Jalankan `ghci BilanganBulat.hs`, lalu ketik `func1 10 20` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 3 — Balas Sapaan

**Nama File:** `BalasSapaan.hs`

**Header:** `module BalasSapaan where`

Sistem chatbot sederhana memerlukan fungsi untuk membalas sapaan dari pengguna. Setiap sapaan memiliki balasan yang telah ditentukan sebelumnya, dan sistem harus dapat mengenali berbagai kategori sapaan seperti sapaan umum, panggilan orang tua, waktu dalam sehari, dan arah mata angin.

Implementasikan fungsi `sing` yang menerima parameter `x` berupa string (sapaan dari pengguna) dan mengembalikan balasan yang sesuai. Gunakan pattern matching dengan `case ... of` untuk pemetaan string.

**Definisi dan Spesifikasi:**

```haskell
sing :: String -> String
-- sing x membalas sapaan dari input string x dengan pemetaan yang telah ditentukan
```

**Pemetaan Sapaan:**

| Kategori | Input | Output |
| --- | --- | --- |
| Sapaan Umum | halo | hi |
|  | hi | halo |
| Orang Tua | bunda | ayah |
|  | ayah | bunda |
| Waktu | pagi | sore |
|  | sore | pagi |
|  | siang | malam |
|  | malam | siang |
| Arah | kiri | kanan |
|  | kanan | kiri |
|  | atas | bawah |
|  | bawah | atas |
| Default | selain di atas | tidak dikenali |

**Contoh Aplikasi:**

```haskell
> sing "halo"
"hi"

> sing "bunda"
"ayah"

> sing "pagi"
"sore"

> sing "kanan"
"kiri"

> sing "tidak ada"
"tidak dikenali"
```

Implementasikan bagian **REALISASI** pada file `BalasSapaan.hs` yang diberikan. Pada `case ... of`, pastikan semua cabang memiliki indentasi yang sejajar dan letakkan pola `_` untuk kasus lainnya di bagian terakhir.

**Tips:** Jalankan `ghci BalasSapaan.hs`, lalu ketik `sing "halo"` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 4 — PosisiAnomali.hs

**Nama File:** `PosisiAnomali.hs`

**Header:** `module PosisiAnomali where`

Alat pendeteksi anomali milik Deeper telah terpasang di Mystery Shack. Alat pendeteksi tersebut dapat menghasilkan 2 buah integer yang melambangkan titik koordinat tempat anomali terdeteksi. Sekarang bantulah Deeper untuk membaca dan melakukan klasifikasi terhadap titik-titik koordinat anomali.

Buatlah file PosisiAnomali.hs. Definisikan sebuah tipe bentukan bernama `Point` dengan konstruktor `Pt` yang menyimpan koordinat 2D (x, y) masing-masing bertipe `Int`. Buatlah sebuah fungsi `posisiTitik` yang menerima input berupa `Point` dan mengembalikan sebuah kode angka (`Int`) yang menunjukkan posisi titik tersebut berada, dengan aturan klasifikasi sebagai berikut:

- **0**: Titik Origin (0, 0)
- **1**: Kuadran 1
- **2**: Kuadran 2
- **3**: Kuadran 3
- **4**: Kuadran 4
- **5**: Berada tepat di Sumbu X, selain titik Origin
- **6**: Berada tepat di Sumbu Y, selain titik Origin

*Catatan: Tambahkan sintaks deriving (Show, Read) agar tipe data kalian bisa dibaca dan di-print.*

**Spesifikasi:**

```haskell
type Point: <x: int, y: int>
posisiTitik :: Point -> Int
```

**Contoh aplikasi fungsi:**

```haskell
> posisiTitik (Pt 5 5)
1
> posisiTitik (Pt 0 4)
6
```

Pada file `PosisiAnomali.hs` yang diberikan, lengkapi bagian **DEFINISI TYPE** menggunakan deklarasi `data`, lalu implementasikan bagian **REALISASI**. Notasi `type Point: ...` di atas bukan sintaks Haskell. Definisi tipe perlu dilengkapi agar file dapat dimuat di GHCi.

**Tips:** Jalankan `ghci PosisiAnomali.hs`, lalu ketik `posisiTitik (Pt 5 5)` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

Kumpulkan file PosisiAnomali.hs

---

## Soal 5 — KonversiWaktu.hs

**Nama File:** `KonversiWaktu.hs`

**Header:** `module KonversiWaktu where`

Mebel ingin melakukan sebuah eksperimen dengan babi kesayangannya. Ia ingin menghitung berapa lama babinya biasanya tidur. Oleh karena itu, ia meminjam alat buatan Deeper yang dapat menghitung waktu dalam satuan detik. Namun, Mebel tidak terbiasa membaca waktu dalam satuan detik dan perlu dalam format jam, menit, dan detik.

Buatlah file KonversiWaktu.hs. Definisikan sebuah tipe bentukan `Jam` dengan data constructor `Jm` yang merepresentasikan waktu `(Jm Jam Menit Detik)`. Buatlah fungsi `detikKeJam` yang menerima total waktu dalam satuan detik dan mengonversinya menjadi data bentukan `Jam`.

**Aturan penting:** Format waktu beroperasi dalam siklus 24 jam. Nilai Jam tidak boleh lebih dari 23. Nilai Menit dan Detik maksimal adalah 59. Asumsikan input selalu bilangan bulat non-negatif.

*Catatan: Tambahkan sintaks deriving (Show, Read) agar tipe dapat dibaca dan ditampilkan ke layar.*

**Spesifikasi Fungsi:**

```haskell
type Jam: <Jam: integer[0..23], Menit: integer[0..59], Detik: integer[0..59]>
detikKeJam :: Int -> Jam
```

**Contoh aplikasi fungsi:**

```haskell
> detikKeJam 3665
Jm 1 1 5
> detikKeJam 86400
Jm 0 0 0
```

Pada file `KonversiWaktu.hs` yang diberikan, lengkapi bagian **DEFINISI TYPE** menggunakan deklarasi `data`, lalu implementasikan bagian **REALISASI**. Notasi `type Jam: ...` di atas bukan sintaks Haskell. Definisi tipe perlu dilengkapi agar file dapat dimuat di GHCi.

**Tips:** Jalankan `ghci KonversiWaktu.hs`, lalu ketik `detikKeJam 3665` untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

Kumpulkan file KonversiWaktu.hs
