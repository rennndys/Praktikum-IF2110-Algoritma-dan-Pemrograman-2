module AturanMcBucket where

-- ATURAN MCBUCKET
-- DEFINISI DAN SPESIFIKASI
buatEnkripsi :: [(Int -> Bool, Int -> Int)] -> (Int -> Int)
-- buatEnkripsi aturan menghasilkan sebuah FUNGSI enkripsi. 
-- Fungsi enkripsi tersebut akan memproses sebuah integer melalui 
-- serangkaian modifikasi berdasarkan aturan yang diberikan secara berurutan.
-- Jika aturan kosong atau tidak ada predikat yang terpenuhi, nilai tetap sama.

-- REALISASI

buatEnkripsi aturan x =
    let {terapkanAturan nilai (predikat, efek)
        | predikat nilai = efek nilai
        | otherwise = nilai}
    in foldl terapkanAturan x aturan
