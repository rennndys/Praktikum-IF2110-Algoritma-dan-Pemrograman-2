# List dan List of List - Praktikum — Latihan Praktikum

## Soal 1 — Soal 1

Deeper Pinus sedang mendengarkan sinyal radio yang ditangkap oleh alat miliknya. Sinyal radio tersebut berisi sederetan angka frekuensi radio (List of Integer). Deeper menyadari bahwa angka-angka tersebut menyembunyikan pesan rahasia yang ia sebut sebagai "Anomali".

Sebuah angka frekuensi ditetapkan sebagai 
**Anomali**
 JIKA DAN HANYA JIKA angka tersebut lebih besar (
`>`
) dari 
**jumlah dua angka yang berada tepat setelahnya**
. Jika sisa angka di belakangnya kurang dari dua buah, maka angka tersebut pasti bukan Anomali.

List didefinisikan secara rekursif, dengan basis berupa list kosong dan rekurens berupa elemen beserta sisa sublist-nya. Buatlah fungsi rekursif 
`cariAnomali`
 yang menerima sederet frekuensi dan mengembalikan list baru yang 
*hanya*
 berisi angka-angka Anomali, dengan mempertahankan urutan kemunculan.

**Spesifikasi Fungsi:**

```haskell
cariAnomali :: [Int] -> [Int]
```

**Contoh aplikasi fungsi:**

```haskell
> cariAnomali [10, 2, 3, 8, 1, 1, 5]
[10, 8]
Penjelasan: 
- 10 > (2 + 3) = 5 (Anomali)
- 2 tidak > (3 + 8) = 11
- 3 tidak > (8 + 1) = 9
- 8 > (1 + 1) = 2 (Anomali)
- 1 tidak > (1 + 5) = 6
- Sisa elemen diabaikan karena tidak punya cukup 2 angka setelahnya.
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Sinyal.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Sinyal.hs`
, lalu ketik 
`cariAnomali [10, 2, 3, 8, 1, 1, 5]`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 2 — Soal 2

Mebel Pinus dan Pacific Southeast sedang mengadakan pesta di waktu yang bersamaan! Mereka masing-masing memiliki daftar ID tamu undangan berbentuk Himpunan (Set). Dalam pemrograman fungsional, Himpunan (set) adalah sebuah list yang setiap elemennya unik dan hanya muncul sekali.

Mereka bertaruh siapa yang memiliki "Tamu Eksklusif" lebih banyak. Seorang tamu disebut 
**Tamu Eksklusif**
 jika ia 
*hanya*
 diundang oleh salah satu dari mereka saja, dan tidak diundang oleh keduanya (
*Symmetric Difference*
 dari kedua himpunan).

Buatlah fungsi 
`tamuEksklusif`
 yang menerima dua Himpunan ID tamu (berupa list of integer), lalu mengembalikan Himpunan baru yang berisi gabungan dari Tamu Eksklusif Mebel dan Tamu Eksklusif Pacific. Tuliskan tamu eksklusif Mebel terlebih dahulu sesuai urutan daftar Mebel, lalu tamu eksklusif Pacific sesuai urutan daftar Pacific. 
*Note: Output juga harus berupa Himpunan yang valid (tidak ada duplikasi)*
.

**Spesifikasi Fungsi:**

```haskell
tamuEksklusif :: [Int] -> [Int] -> [Int]
```

**Contoh aplikasi fungsi:**

```haskell
> tamuEksklusif [1, 2, 3] [3, 4, 5]
[1, 2, 4, 5]
> tamuEksklusif [9, 8] [9, 8]
[]
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Pesta.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Pesta.hs`
, lalu ketik 
`tamuEksklusif [1, 2, 3] [3, 4, 5]`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 3 — Soal 3

Deeper sedang mencoba mendekripsi pesan rahasia dari jurnal yang ditulis dalam bentuk Sandi Fraktal. Sandi ini memiliki struktur 
**List of List**
.

List of list adalah list yang elemennya mungkin berupa sebuah elemen tunggal (
*Atom*
), atau berupa 
*List*
 lain di dalamnya. Untuk memodelkannya di Haskell, Deeper menggunakan Algebraic Data Type (ADT) berikut:

```haskell
data Sandi = Atom Char | List [Sandi] deriving (Show, Read)
```

Sandi ini harus dievaluasi menjadi sebuah Teks / String (List of Character) dengan aturan depth:

- Saat fungsi pertama kali dipanggil, 
*depth*
-nya adalah 
**1**
.
- Jika sandi berupa 
`List [...]`
, maka ia harus masuk ke list tersebut, yang menyebabkan 
**depth bertambah 1**
 untuk seluruh elemen di dalamnya (scope depth hanya di dalam list tersebut).
- Jika sandi berupa 
`Atom c`
, maka karakter 
`c`
 tersebut akan 
**ditulis berulang sebanyak depth pada scope list tersebut**
. (Misal: 
`Atom 'Z'`
 di depth 3 menjadi 
`"ZZZ"`
).
- Jika 
`List`
 tersebut kosong (
`[]`
), maka tidak menghasilkan karakter apa pun (string kosong 
`""`
).
- Gabungkan semua hasil penguraian Teks menggunakan operator konkatenasi 
`++`
.

Buatlah fungsi 
`dekripsi`
 yang menerima struktur 
`Sandi`
 dan mengembalikan Teks hasil dekripsinya!

**Spesifikasi Fungsi:**

```haskell
data Sandi = Atom Char | List [Sandi] deriving (Show, Read)
dekripsi :: Sandi -> String
```

**Contoh aplikasi fungsi:**

```haskell
> dekripsi (Atom 'X')
"X"
Penjelasan: Depth 1. 'X' diulang 1 kali.

> dekripsi (List [Atom 'A', List [Atom 'B']])
"AABBB"
Penjelasan: 
- Masuk ke dalam `List` terluar. Depth menjadi 2.
- Di depth 2, terdapat `Atom 'A'`. Karakter 'A' diulang 2 kali -> "AA".
- Di depth 2, terdapat `List` baru. Masuk ke list tersebut, depth naik menjadi 3.
- Di depth 3, terdapat `Atom 'B'`. Karakter 'B' diulang 3 kali -> "BBB".
- Dekripsi = "AA" ++ "BBB" = "AABBB".

> dekripsi (List [Atom 'A', List [Atom 'B'], Atom 'C'])
"AABBBCC"
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Fraktal.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Fraktal.hs`
, lalu ketik 
`dekripsi (List [Atom 'A', List [Atom 'B']])`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 4 — Soal 4

Paman Stun mengadakan perkemahan di Mystery Shack. Para peserta dibagi menjadi beberapa kelompok, dan setiap kelompok berbaris dengan urutan tertentu. Setiap anak diberi nomor punggung, sehingga sebuah kelompok dapat ditulis sebagai list bilangan bulat, dan seluruh kelompok ditulis sebagai list of list. Ada juga kelompok yang tidak memiliki anggota sama sekali.

Karena arah lapangan berubah, Deeper meminta agar 
**setiap kelompok berbalik arah**
: anak yang tadinya paling belakang kini berada di paling depan. Namun urutan kelompoknya sendiri tidak berubah, kelompok pertama tetap kelompok pertama.

Buatlah fungsi 
`balikBarisan`
 yang menerima barisan seluruh kelompok, lalu mengembalikan barisan baru dengan isi setiap kelompok dibalik urutannya.

**Spesifikasi Fungsi:**

```haskell
balikBarisan :: [[Int]] -> [[Int]]
```

**Contoh aplikasi fungsi:**

```haskell
> balikBarisan [[1,2],[3],[4,5]]
[[2,1],[3],[5,4]]
> balikBarisan [[],[7,8,9]]
[[],[9,8,7]]
> balikBarisan []
[]
```

Jangan gunakan fungsi 
`reverse`
 atau 
`map`
 untuk membuat REALISASI.

**Hint:**
 '
`:`
' menempelkan satu elemen ke depan sebuah list, '
`++`
' menggabungkan dua buah list, dan '
`[...]`
' dapat membungkus sebuah elemen menjadi list berisi satu anggota, misalnya 
`[x]`
.

Implementasikan bagian 
**REALISASI**
 pada file 
`BalikBarisan.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci BalikBarisan.hs`
, lalu ketik 
`balikBarisan [[1,2],[3],[4,5]]`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 5 — Soal 5

Dalam pengolahan citra, sebuah gambar dinyatakan sebagai matriks bilangan bulat yang direpresentasikan sebagai list of list, dengan setiap list di dalamnya mewakili satu baris. Sebelum operasi konvolusi dilakukan, matriks tersebut diberi 
*zero padding*
,
    yaitu satu lapis elemen bernilai 0 yang ditambahkan mengelilingi matriks pada keempat sisinya, sehingga ukurannya bertambah satu pada setiap arah.

Buatlah fungsi 
`padding`
 yang menerima banyaknya elemen pada setiap baris matriks beserta matriksnya, lalu mengembalikan matriks yang telah diberi satu lapis padding bernilai 0. Untuk membantu, realisasikan juga fungsi antara 
`barisNol`
,
    
`padBaris`
, dan 
`padSemuaBaris`
.

**Spesifikasi Fungsi:**

```haskell
barisNol :: Int -> [Int]
padBaris :: [Int] -> [Int]
padSemuaBaris :: [[Int]] -> [[Int]]
padding :: Int -> [[Int]] -> [[Int]]
```

**Batasan:**

- Matriks tidak kosong dan setiap barisnya tidak kosong.
- Setiap baris matriks memiliki banyak elemen yang sama.
- Parameter pertama 
`padding`
 adalah banyaknya elemen pada setiap baris matriks.
- Gunakan rekursi. Jangan gunakan fungsi 
`map`
 atau 
`replicate`
 untuk membuat REALISASI.

**Contoh aplikasi fungsi:**

```haskell
> padding 2 [[1,2],[3,4]]
[[0,0,0,0],[0,1,2,0],[0,3,4,0],[0,0,0,0]]
> padding 1 [[5]]
[[0,0,0],[0,5,0],[0,0,0]]
> padding 3 [[1,2,3]]
[[0,0,0,0,0],[0,1,2,3,0],[0,0,0,0,0]]
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Padding.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Padding.hs`
, lalu ketik 
`padding 2 [[1,2],[3,4]]`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.
