module GedungTerlihat where

-- KODE JURNAL
-- DEFINISI DAN SPESIFIKASI
gedungTerlihat :: Int -> Int -> String
-- gedungTerlihat x y menentukan apakah gedung dengan tinggi y terlihat dari pengamat dengan tinggi x

-- REALISASI
gedungTerlihat x y = if x >= y then "Tidak terlihat" else "Terlihat"

-- APLIKASI
-- gedungTerlihat 10 5
