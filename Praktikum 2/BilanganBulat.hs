module BilanganBulat where

-- KODE JURNAL
-- DEFINISI DAN SPESIFIKASI
-- Helper function untuk menentukan kondisi
func2 :: Int -> Int
-- func2 x menghasilkan x - 5

func1 :: Int -> Int -> String
-- func1 x y menentukan apakah y adalah kelipatan x, bergantung pada func2(x)

-- REALISASI
func2 x = x - 5

func1 x y = if func2 x > 0 then
                if y `mod` x == 0 then "bulat" else "tidak bulat"
            else
                "tidak mungkin"

-- APLIKASI
-- func1 10 20
