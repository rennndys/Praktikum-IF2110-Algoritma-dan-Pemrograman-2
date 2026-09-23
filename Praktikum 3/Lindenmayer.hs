module Lindenmayer where

-- BAKTERI LINDENMAYER
-- DEFINISI DAN SPESIFIKASI
populasiBakteri :: Int -> Char -> Int
-- populasiBakteri n c menghasilkan total populasi pada generasi ke-n,
-- dimulai dari satu bakteri c, dengan 0 <= n <= 20.

-- REALISASI
populasiBakteri n c
    | n == 0    = 1
    | c == 'A'  = populasiBakteri (n - 1) 'B' + populasiBakteri (n - 1) 'B'
    | c == 'B'  = populasiBakteri (n - 1) 'A' + populasiBakteri (n - 1) 'B' + populasiBakteri (n - 1) 'C'
    | c == 'C'  = 1 + populasiBakteri (n - 1) 'C'
    | otherwise = 1

-- APLIKASI
-- populasiBakteri 2 'A'