# Higher Order Function / Fungsi Sebagai Nilai — Latihan Praktikum

## Soal 1

Musim panas di Nangor Falls tidak pernah membosankan. Suatu malam, Deeper dan Mebel menemukan sebuah
    mesin tua di ruang rahasia di bawah Mystery Shack, yaitu rancangan Paman Frod yang bernama Kalkulator Deret . Mesin ini bekerja dengan fungsi sebagai nilai , tetapi dua bagiannya rusak.
    Anda diminta membuat Kalkulator Deret tersebut berfungsi kembali. Kalkulator ini memiliki dua fungsi yang
    harus Anda realisasikan: sigma yang menjumlahkan suku-suku sebuah deret, dan ulang yang membentuk fungsi baru dengan menerapkan sebuah fungsi berulang kali.

Spesifikasi Fungsi:

```haskell
sigma :: Integer -> Integer -> (Integer -> Integer) -> (Integer -> Integer) -> Integer
ulang :: Int -> (a -> a) -> (a -> a)
```

- sigma a b f s menghasilkan jumlah f(a) + f(s(a)) + f(s(s(a))) + ... , dengan nilai a , s(a) , s(s(a)) , ... yang dipakai hanya yang tidak melebihi b . Jika a > b , hasilnya 0 .
- ulang n f menghasilkan fungsi baru yang menerapkan f sebanyak n kali. Jika n = 0 , fungsi yang dihasilkan tidak mengubah nilai yang diberikan.

Batasan:

- 1 ≤ a dan b ≤ 1000 pada sigma .
- Fungsi s pada sigma selalu memenuhi s(x) > x untuk semua x ≥ a , sehingga deret pasti berhenti.
- 0 ≤ n ≤ 4 pada ulang .
- Nilai x yang diberikan pada fungsi hasil ulang memenuhi -10 ≤ x ≤ 10 .
- Seluruh perhitungan aman dari overflow karena menggunakan Integer ( arbitrary precision ).

Contoh aplikasi fungsi:

```haskell
> sigma 1 5 (\x -> x) (\x -> x + 1)
15
> sigma 1 10 (\x -> x * x) (\x -> x + 2)
165
> sigma 5 4 (\x -> x) (\x -> x + 1)
0
> ulang 3 (\x -> 2 * x) 5
40
> ulang 0 (\x -> 2 * x) 5
5
> ulang 2 (\x -> x * x) 3
81
```

Penjelasan contoh:

- Pada sigma 1 10 (\x -> x * x) (\x -> x + 2) , nilai awalnya 1 dan batas akhirnya 10 . Fungsi langkah s , yaitu \x -> x + 2 , menentukan nilai berikutnya: 1 + 2 = 3 , 3 + 2 = 5 , 5 + 2 = 7 , 7 + 2 = 9 , lalu 9 + 2 = 11 . Nilai 11 tidak diproses karena melebihi batas 10 . Fungsi suku f , yaitu \x -> x * x , menguadratkan setiap nilai dari 1, 3, 5, 7, 9 , sehingga diperoleh 1, 9, 25, 49, 81 . Hasil sigma adalah jumlahnya: 1 + 9 + 25 + 49 + 81 = 165 .
- ulang 2 (\x -> x * x) menghasilkan fungsi yang menguadratkan bilangan dua kali. Saat fungsi tersebut diberi nilai 3 , penerapan pertama menghasilkan 3 * 3 = 9 . Penerapan kedua menggunakan hasil sebelumnya, sehingga menghasilkan 9 * 9 = 81 .

Implementasikan bagian REALISASI pada file KalkulatorDeret.hs yang diberikan.

Tips: Jalankan ghci KalkulatorDeret.hs , lalu ketik sigma 1 5 (\x -> x) (\x -> x + 1) untuk menguji realisasimu sebelum mengumpulkan file ke Olympia. Kamu juga dapat memakai fungsi bernama dari bagian utility, misalnya sigma 1 5 (fungsi "id") (fungsi "tambah1") .

---

## Soal 2

Deeper dan Mebel menemukan sebuah terminal pengolah data di ruang rahasia Mystery Shack. Terminal tersebut menerima list bilangan bulat hasil pengamatan dan mengolahnya dengan cara yang berbeda-beda. Sayangnya, dua fungsi pada terminal tersebut rusak, dan Anda diminta memperbaikinya.

Spesifikasi Fungsi:

```haskell
hasilOlah :: [Integer] -> (Integer -> Bool) -> (Integer -> Integer) -> [Integer]
catatanBersih :: [[Integer]] -> [[Integer]]
```

- hasilOlah l p f memeriksa setiap elemen list l menggunakan fungsi p . Elemen diambil jika p menghasilkan True untuk elemen tersebut, lalu diubah menggunakan fungsi f . Urutan elemennya tetap sama.
- catatanBersih m menghapus bilangan nol dan negatif dari setiap baris pada m . Baris yang kosong, baik sejak awal maupun setelah dibersihkan, juga dihapus. Urutan baris dan bilangan yang tersisa tidak berubah.

Batasan:

- Pada hasilOlah , list dapat kosong atau memiliki paling banyak 100 elemen.
- Pada catatanBersih , list of list memiliki paling banyak 10 baris, dan setiap baris memiliki paling banyak 10 elemen. Baris dapat kosong.
- Setiap elemen berada pada rentang -1000 sampai 1000.

Contoh aplikasi fungsi:

```haskell
> hasilOlah [1,2,3,4,5] (\x -> x > 2) (\x -> x * 10)
[30,40,50]

> hasilOlah [-3,-2,-1,0,1,2] (\x -> x `mod` 2 == 0) (\x -> x + 5)
[3,5,7]

> hasilOlah [10,20,30] (\x -> x > 100) (\x -> x * x)
[]

> hasilOlah [] (\x -> x > 0) (\x -> x + 1)
[]

> catatanBersih [[1,-2,3],[-4,-5],[6]]
[[1,3],[6]]

> catatanBersih [[],[0,-1]]
[]

> catatanBersih []
[]
```

Penjelasan contoh:

- Pada contoh pertama hasilOlah , hanya 3, 4, 5 yang lebih besar dari 2 . Ketiganya kemudian dikalikan 10 , sehingga hasilnya [30,40,50] .
- Pada catatanBersih [[1,-2,3],[-4,-5],[6]] , setelah bilangan nol dan negatif dihapus, baris-barisnya menjadi [[1,3],[],[6]] . Baris kosong tidak ikut dalam hasil, sehingga diperoleh [[1,3],[6]] .

Implementasikan bagian REALISASI pada file PenyaringPengubah.hs yang diberikan.

Petunjuk: Kamu boleh menggunakan fungsi bawaan Haskell seperti filter untuk memilih elemen yang memenuhi suatu kondisi dan map untuk menerapkan fungsi pada setiap elemen list.

Tips: Jalankan ghci PenyaringPengubah.hs , lalu ketik hasilOlah [1,2,3,4,5] (\x -> x > 2) (\x -> x * 10) untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 3

Deeper dan Mebel sedang menyusuri hutan Nangor Falls ketika sekelompok gnome berbaris di depan mereka. Deeper berdiri di ujung paling kanan barisan dan menghadap ke kiri. Karena Deeper ingin tahu berapa banyak gnome yang berhasil ia lihat, ia mencatat tinggi setiap gnome dari kiri ke kanan.

Sebuah gnome terlihat oleh Deeper jika dan hanya jika gnome tersebut lebih tinggi dari semua gnome yang berada di sebelah kanannya. Gnome dengan tinggi yang sama dengan gnome di kanannya tidak terlihat karena terhalang. Gnome paling kanan selalu terlihat.

Tugas Anda adalah menghasilkan list tinggi gnome yang terlihat oleh Deeper, dengan urutan yang sama seperti pada barisan aslinya.

Spesifikasi Fungsi:

```haskell
gnomeTerlihat :: [Integer] -> [Integer]
```

Batasan:

- List dapat kosong atau memiliki paling banyak 100 elemen.
- Setiap elemen list berada pada rentang 1 sampai 1000.

Contoh aplikasi fungsi:

```haskell
> gnomeTerlihat [16,17,4,3,5,2]
[17,5,2]

> gnomeTerlihat [5,5]
[5]

> gnomeTerlihat [1,2,3,4,5]
[5]

> gnomeTerlihat [5,4,3,2,1]
[5,4,3,2,1]

> gnomeTerlihat []
[]
```

Penjelasan contoh: Pada [16,17,4,3,5,2] , gnome 2 selalu terlihat karena berada paling kanan. Gnome 5 lebih tinggi dari 2 , sedangkan 3 dan 4 terhalang oleh 5 . Gnome 17 lebih tinggi dari semua gnome di kanannya, tetapi 16 terhalang oleh 17 . Dengan mempertahankan urutan barisan awal, hasilnya adalah [17,5,2] .

Implementasikan bagian REALISASI pada file BarisanGnome.hs yang diberikan.

Petunjuk: Soal ini dirancang untuk latihan foldr . Pahami cara kerjanya: foldr (+) 0 [1,2,3] setara dengan 1 + (2 + (3 + 0)) . Rekursi langsung tetap boleh, tetapi disarankan memakai foldr untuk berlatih :)

Tips: Jalankan ghci BarisanGnome.hs , lalu ketik gnomeTerlihat [16,17,4,3,5,2] untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 4

Paman Frod sedang mengisi daya Quantum Destabilizer , senjata pamungkas untuk mengalahkan Bill Cipher. Daya tembakan senjata ini dihitung dengan sebuah "Faktor Amplifikasi Total". Faktor ini adalah hasil kali (perkalian berurut) dari energi resonansi pada rentang frekuensi tertentu (mirip dengan Notasi Pi / Π dalam matematika).

Setiap frekuensi dasar akan diproses melalui sebuah Fungsi Transformasi . Frekuensi kemudian akan meningkat sebesar nilai Step tertentu hingga mencapai atau melewati batas akhir frekuensi.

Buatlah sebuah Higher-Order Function bernama amplifikasiQuantum yang menerima empat parameter dengan urutan berikut:

1. Sebuah fungsi transformasi energi (Fungsi yang diterapkan pada setiap nilai frekuensi).
2. Nilai awal frekuensi ( startInt ).
3. Nilai akhir frekuensi ( endInt ).
4. Nilai peningkatan frekuensi ( step ).

Fungsi amplifikasiQuantum harus mengembalikan total hasil kali dari energi hasil transformasi frekuensi yang dimulai dari startInt , bertambah sebesar step pada setiap iterasinya, selama nilai frekuensi tersebut kurang dari atau sama dengan endInt .

Definisi dan Spesifikasi:

```haskell
amplifikasiQuantum :: (Int -> Int) -> Int -> Int -> Int -> Int
-- amplifikasiQuantum f start end step menghasilkan perkalian dari:
-- f(start) * f(start + step) * f(start + 2*step) * ... 
-- selama nilai (start + k*step) <= end.
-- Jika start > end, fungsi mengembalikan bilangan identitas perkalian.
```

Batasan:

- step ≥ 1 , sehingga frekuensi selalu meningkat.
- Seluruh nilai dan perhitungan, termasuk penambahan frekuensi, transformasi, dan hasil perkalian antara, dijamin berada dalam rentang Int (tidak terjadi overflow ).

Contoh Aplikasi:

```haskell
> fungsiTambahSatu x = x + 1
> amplifikasiQuantum fungsiTambahSatu 1 5 2
48
-- Penjelasan: Nilai frekuensi yang dievaluasi adalah 1, 3, 5 (karena step = 2).
-- Hasil transformasinya: (1+1) * (3+1) * (5+1) = 2 * 4 * 6 = 48.

> amplifikasiQuantum (\x -> x * 2) 2 10 3
640
-- Penjelasan: Nilai frekuensi adalah 2, 5, 8. (11 diabaikan karena > 10).
-- Hasil transformasinya: (2*2) * (5*2) * (8*2) = 4 * 10 * 16 = 640.

> amplifikasiQuantum (\x -> x * 10) 10 5 1
1
-- Penjelasan: start (10) > end (5), kembalikan elemen identitas perkalian (1).
```

Implementasikan bagian REALISASI pada file AmplifikasiQuantum.hs yang diberikan.

Petunjuk: Pola pengolahannya mirip dengan sigma pada Soal 1. Coba lihat kembali realisasimu :)

Tips: Jalankan ghci AmplifikasiQuantum.hs , lalu ketik amplifikasiQuantum (\x -> x + 1) 1 5 2 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.

---

## Soal 5

Untuk melindungi ingatannya, McBucket menciptakan sebuah generator enkripsi memori. McBucket membuat sebuah alat yang akan menyusun dan mengembalikan sebuah fungsi enkripsi baru berdasarkan daftar aturan keamanan yang diberikan.

Setiap "aturan keamanan" direpresentasikan sebagai sebuah Tuple (predikat, efek) . 
Ketika memori masuk ke fungsi enkripsi yang dihasilkan:

1. Memori akan melewati setiap aturan keamanan secara berurutan (dari elemen pertama list hingga terakhir).
2. Pada setiap aturan, jika memori saat itu memenuhi predikat (bernilai True ), maka nilainya akan diubah oleh fungsi efek .
3. Jika tidak memenuhi predikat , nilainya tetap (tidak berubah) dan langsung diteruskan ke aturan berikutnya.

Jika daftar aturan kosong atau tidak ada predikat yang terpenuhi selama pemrosesan, nilai memori tetap sama.

Buatlah fungsi buatEnkripsi yang menerima sebuah list berisi pasangan fungsi (Int -> Bool, Int -> Int) . Fungsi ini tidak mengembalikan angka , melainkan mengembalikan sebuah fungsi bertipe (Int -> Int) yang akan digunakan untuk mengenkripsi memori.

Definisi dan Spesifikasi:

```haskell
buatEnkripsi :: [(Int -> Bool, Int -> Int)] -> (Int -> Int)
-- buatEnkripsi aturan menghasilkan sebuah FUNGSI enkripsi. 
-- Fungsi enkripsi tersebut akan memproses sebuah integer melalui 
-- serangkaian modifikasi berdasarkan aturan yang diberikan secara berurutan.
```

Contoh Aplikasi (di GHCI):

```haskell
> -- Definisikan beberapa aturan
> aturan1 = (\x -> x > 10, \x -> x - 5)
> aturan2 = (\x -> mod x 2 == 0, \x -> x * 10)
> listAturan = [aturan1, aturan2]

> -- Buat fungsi enkripsinya
> enkripsiA = buatEnkripsi listAturan

> -- Gunakan fungsi yang baru saja dibuat
> enkripsiA 12
7
-- Penjelasan proses 12: 
-- aturan1: 12 > 10 (True) -> 12 - 5 = 7. Nilai memori sekarang 7.
-- aturan2: 7 genap? (False) -> Nilai tetap 7. Hasil akhir 7.

> enkripsiA 8
80
-- Penjelasan proses 8:
-- aturan1: 8 > 10 (False) -> Nilai tetap 8.
-- aturan2: 8 genap? (True) -> 8 * 10 = 80. Hasil akhir 80.

> enkripsiA 15
100
-- Penjelasan proses 15:
-- aturan1: 15 > 10 (True) -> 15 - 5 = 10. Nilai memori sekarang 10.
-- aturan2: 10 genap? (True) -> 10 * 10 = 100. Hasil akhir 100.
```

Implementasikan bagian REALISASI pada file AturanMcBucket.hs yang diberikan.

Petunjuk: foldl bisa dipakai untuk mengolah aturan dari kiri ke kanan sambil membawa nilai memori terbaru. Sebagai gambaran, foldl (+) 0 [1,2,3] setara dengan ((0 + 1) + 2) + 3 . Rekursi langsung juga boleh.

Tips: Jalankan ghci AturanMcBucket.hs , lalu ketik buatEnkripsi [] 9 untuk menguji realisasimu sebelum mengumpulkan file ke Olympia.
