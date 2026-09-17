module KoinMysteryShack where

-- KOIN MYSTERY SHACK
-- DEFINISI DAN SPESIFIKASI
hitungKoin :: Int -> Int -> Int -> Int -> (Int, Int)
-- hitungKoin quarter dime nickel penny menghasilkan pasangan
-- (dollar, sen) yang senilai dengan seluruh koin

-- REALISASI
hitungKoin quarter dime nickel penny = 
    let
        jumlah = quarter * 25 + dime * 10 + nickel * 5 + penny * 1
    in 
        (div jumlah 100, mod jumlah 100)

-- APLIKASI
-- hitungKoin 8 20 30 77
