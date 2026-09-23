# Analisis Rekurens dan Type Rekursif - Praktikum — Latihan Praktikum

## Soal 1 — Energi Portal

### Energi Portal

Dipper menemukan sebuah portal di hutan Nangor Falls dengan energi awal 
`e`
. Portal hanya dapat diaktifkan ketika energinya masih positif. Setiap kali diaktifkan, energinya menjadi setengah dari energi sebelumnya, dibulatkan ke bawah.

Buatlah fungsi 
`jumlahAktivasi`
 yang menghitung banyak aktivasi sampai energi portal menjadi nol. Jika energi awal sudah nol, portal tidak dapat diaktifkan.

**Definisi dan Spesifikasi:**

```haskell
jumlahAktivasi :: Int -> Int
-- jumlahAktivasi e menghasilkan banyak aktivasi sampai energi e menjadi nol.
```

**Batasan:**

- 0 ≤ e ≤ 10^9

**Contoh Aplikasi:**

```haskell
> jumlahAktivasi 0
0

> jumlahAktivasi 1
1

> jumlahAktivasi 13
4
```

Pada contoh terakhir, perubahan energinya adalah 
`13 → 6 → 3 → 1 → 0`
, sehingga terdapat empat aktivasi.

Implementasikan bagian 
**REALISASI**
 pada file 
`EnergiPortal.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci EnergiPortal.hs`
, lalu ketik 
`jumlahAktivasi 13`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 2 — Digit Anomali

### Digit Anomali

Dipper menemukan kode bilangan bulat nonnegatif di Jurnal 3. Sebuah digit 
`d`
 dianggap sebagai penanda anomali. Untuk membaca kode tersebut, ia perlu mengetahui berapa kali digit itu muncul.

Buatlah fungsi 
`hitungDigit`
 yang menerima bilangan 
`n`
 dan digit 
`d`
, lalu menghasilkan banyak kemunculan digit 
`d`
 dalam representasi desimal 
`n`
.

Bilangan ditulis tanpa nol di depan. Bilangan 
`0`
 terdiri dari satu digit, yaitu 
`0`
.

**Definisi dan Spesifikasi:**

```haskell
hitungDigit :: Int -> Int -> Int
-- hitungDigit n d menghasilkan banyak kemunculan digit d dalam bilangan n.
```

**Batasan:**

- 0 ≤ n ≤ 10^9
- 0 ≤ d ≤ 9

**Contoh Aplikasi:**

```haskell
> hitungDigit 707070 7
3

> hitungDigit 707070 0
3

> hitungDigit 12345 9
0

> hitungDigit 0 0
1
```

Implementasikan bagian 
**REALISASI**
 pada file 
`DigitAnomali.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci DigitAnomali.hs`
, lalu ketik 
`hitungDigit 707070 7`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 3 — Kotak Bersarang

### Kotak Bersarang

Paman Stan menyimpan koin dalam susunan kotak bersarang di Mystery Shack. Setiap kotak menyimpan sejumlah koin dan satu susunan kotak di dalamnya.

Susunan kotak direpresentasikan oleh tipe rekursif 
`Kotak`
 berikut:

```haskell
data Kotak = Kosong | Kotak Int Kotak
    deriving (Show, Read)
```

- `Kosong`
 menandakan tidak ada kotak lagi.
- `Kotak jumlahKoin kotakDalam`
 menandakan sebuah kotak yang menyimpan 
`jumlahKoin`
 koin dan susunan 
`kotakDalam`
 di dalamnya.

Buatlah fungsi 
`totalKoin`
 yang menghitung jumlah koin pada seluruh susunan. Kotak yang menyimpan nol koin tetap dapat memiliki kotak lain di dalamnya.

**Definisi dan Spesifikasi:**

```haskell
totalKoin :: Kotak -> Int
-- totalKoin kotak menghasilkan jumlah koin pada seluruh susunan kotak.
```

**Batasan:**

- Banyak lapisan kotak: 0 sampai 100.
- Banyak koin pada setiap lapisan: 0 sampai 1.000.

**Contoh Aplikasi:**

```haskell
> totalKoin Kosong
0

> totalKoin (Kotak 5 Kosong)
5

> totalKoin (Kotak 5 (Kotak 0 (Kotak 3 Kosong)))
8
```

Gunakan rekursi dan pattern matching pada tipe 
`Kotak`
. Definisi tipe sudah disediakan pada template; gunakan nama tipe dan konstruktor tersebut.

Implementasikan bagian 
**REALISASI**
 pada file 
`KotakBersarang.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci KotakBersarang.hs`
, lalu ketik 
`totalKoin (Kotak 5 (Kotak 0 (Kotak 3 Kosong)))`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 4 — Soal 4

Deeper menemukan sebuah bakteri aneh yang memiliki sistem pembelahan tidak biasa. Dia menamai bakteri ini sebagai bakteri Lindenmayer. Bakteri ini terdiri dari berbagai spesies yang dinamai dengan suatu karakter alfabet. Beberapa spesies memiliki aturan
    pembelahan, seperti berikut:

- Bakteri 
`'A'`
 membelah menjadi dua bakteri: 
`'B'`
 dan 
`'B'`
.
- Bakteri 
`'B'`
 membelah menjadi tiga bakteri: 
`'A'`
, 
`'B'`
, dan 
`'C'`
.
- Bakteri 
`'C'`
 membelah menjadi dua bakteri: 
`'X'`
 dan 
`'C'`
.
- **Bakteri lainnya**
 (selain A, B, dan C) tidak melakukan pembelahan.

Setiap generasi (iterasi), seluruh bakteri membelah secara bersamaan. Sebagai contoh, jika kita mulai dari satu bakteri 
`'A'`
 (Generasi 0), pada Generasi 1 ia menjadi 
`'B' 'B'`
 (populasi = 2). Pada Generasi 2, 
`'B' 'B'`
    menjadi 
`'A' 'B' 'C' 'A' 'B' 'C'`
, sehingga total populasinya adalah 6. Pada Generasi 3 menjadi 
`'B' 'B' 'A' 'B' 'C' 'X' 'C' 'B' 'B' 'A' 'B' 'C' 'X' 'C'`
 (populasi = 14). Jika kita mulai dari bakteri 
`'C'`
, pada generasi
    1 ia menjadi 
`'X' 'C'`
, generasi 2 menjadi 
`'X' 'X' 'C'`
, ...

Buatlah fungsi rekursif 
`populasiBakteri`
 yang menerima angka generasi n dan sebuah karakter alfabet, lalu mengembalikan 
**total populasi**
 pada generasi ke-n. Pada generasi 0, populasinya selalu 1.

**Spesifikasi Fungsi:**

```haskell
populasiBakteri :: Int -> Char -> Int
```

**Batasan:**
 
`0 ≤ n ≤ 20`
. Karakter masukan adalah huruf kapital 
`'A'`
–
`'Z'`
.

**Contoh aplikasi fungsi:**

```haskell
> populasiBakteri 0 'A'
1
> populasiBakteri 2 'A'
6
> populasiBakteri 3 'A'
14
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Lindenmayer.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Lindenmayer.hs`
, lalu ketik 
`populasiBakteri 2 'A'`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 5 — Soal 5

Mebel ingin mengajari babinya melakukan perhitungan aritmatika dengan penjumlahan dan perkalian. Namun, Mebel sendiri kesulitan mengevaluasi ekspresi aritmatika sederhana tersebut. Oleh karena itu, Mebel meminta Deeper membuatkannya sebuah kalkulator. Bantulah Deeper membuat kalkulator ini.

Sebuah kalkulator mengevaluasi operasi matematika dengan memecahnya menjadi struktur hierarki. Tipe rekursif 
`Expr`
 yang disediakan dapat merepresentasikan tiga hal:

- `Val Int`
: Sebuah nilai integer tunggal (Basis).
- `Add Expr Expr`
: Operasi penjumlahan dari dua buah ekspresi (Rekurens).
- `Mul Expr Expr`
: Operasi perkalian dari dua buah ekspresi (Rekurens).

Selanjutnya, buatlah fungsi 
`evaluasi`
 yang menerima sebuah ekspresi bertipe 
`Expr`
 dan mengembalikan hasil perhitungan akhirnya sebagai 
`Int`
.

**Spesifikasi Fungsi:**

```haskell
data Expr = Val Int | Add Expr Expr | Mul Expr Expr deriving (Show, Read)
evaluasi :: Expr -> Int
```

**Batasan:**
 Ekspresi terdiri dari paling banyak 100 konstruktor (
`Val`
, 
`Add`
, dan 
`Mul`
 dihitung masing-masing satu). Setiap nilai pada 
`Val`
 dan hasil evaluasi setiap subekspresi dijamin berada dalam rentang −10
9
 sampai 10
9
.

**Contoh aplikasi fungsi:**

```haskell
> evaluasi (Val 5)
5
> evaluasi (Add (Val 3) (Mul (Val 2) (Val 4)))
11
```

Implementasikan bagian 
**REALISASI**
 pada file 
`Ekspresi.hs`
 yang diberikan.

**Tips:**
 Jalankan 
`ghci Ekspresi.hs`
, lalu ketik 
`evaluasi (Add (Val 3) (Mul (Val 2) (Val 4)))`
 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.
