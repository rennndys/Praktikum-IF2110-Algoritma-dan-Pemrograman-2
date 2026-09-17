module KonversiWaktu where

-- KONVERSI WAKTU
-- DEFINISI TYPE
data Jam = Jm Int Int Int deriving(Show, Read)
-- Tuliskan definisi tipe Jam dengan konstruktor Jm untuk jam, menit, dan detik.
-- Tambahkan deriving (Show, Read).
-- Lengkapi definisi tipe terlebih dahulu agar file dapat dimuat di GHCi.

-- DEFINISI DAN SPESIFIKASI
detikKeJam :: Int -> Jam
-- detikKeJam total mengonversi detik menjadi Jam dalam siklus 24 jam.

-- REALISASI
detikKeJam total = Jm (total `div` 3600 `mod` 24) (total `div` 60 `mod` 60) (total `mod` 60)

-- APLIKASI
-- detikKeJam 3665
