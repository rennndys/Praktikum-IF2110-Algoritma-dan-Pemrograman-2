module DigitAnomali where

-- DIGIT ANOMALI
-- DEFINISI DAN SPESIFIKASI
hitungDigit :: Int -> Int -> Int
-- hitungDigit n d menghasilkan banyak kemunculan digit d dalam bilangan n.

-- REALISASI
hitungDigit n d 
    |(n < 10) && (n == d) = 1
    |(n < 10) && (n /= d) = 0
    |(n `mod` 10 /= d) = hitungDigit (n `div` 10) d
    |(n `mod` 10 == d) = 1 + hitungDigit (n `div` 10) d


-- APLIKASI
-- hitungDigit 707070 7
