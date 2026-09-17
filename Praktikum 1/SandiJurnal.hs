module SandiJurnal where

-- SANDI JURNAL
-- DEFINISI DAN SPESIFIKASI
isSandiValid :: Int -> Bool
-- isSandiValid sandi benar jika sandi terdiri dari tiga digit,
-- digit pertama dan terakhir sama, digit tengah berbeda,
-- dan jumlah ketiga digit habis dibagi tiga

-- REALISASI
isSandiValid sandi =
    let
        digitPertama = div sandi 100
        digitKedua = div (sandi - (digitPertama * 100)) 10
        digitKetiga = (sandi - (digitPertama * 100) - (digitKedua * 10))
    in
        (div sandi 1000 == 0) && (div sandi 100 > 0) && (digitPertama == digitKetiga) && (digitKedua /= digitPertama) && (mod (digitPertama + digitKedua + digitKetiga) 3 == 0) 

-- APLIKASI
-- isSandiValid 252
