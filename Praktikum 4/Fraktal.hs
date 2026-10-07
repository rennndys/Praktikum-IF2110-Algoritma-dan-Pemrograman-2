module Fraktal where

-- Sandi Fraktal
-- DEFINISI DAN SPESIFIKASI
data Sandi = Atom Char | List [Sandi] deriving (Show, Read)

dekripsi :: Sandi -> String
-- Tentunya boleh buat helper function tambahan

-- REALISASI
dekripsi sandi = dekripsi' sandi 1

dekripsi' :: Sandi -> Int -> String
dekripsi' (Atom c) depth = ulang c depth
dekripsi' (List xs) depth = dekripsiList xs (depth + 1)

dekripsiList :: [Sandi] -> Int -> String
dekripsiList [] _ = ""
dekripsiList (x:xs) depth = dekripsi' x depth ++ dekripsiList xs depth

ulang :: Char -> Int -> String
ulang _ 0 = ""
ulang c n = c : ulang c (n - 1)

-- APLIKASI
-- > dekripsi (Atom 'X')
-- "X"
-- Penjelasan: Depth 1. 'X' diulang 1 kali.
--
-- > dekripsi (List [Atom 'A', List [Atom 'B']])
-- "AABBB"
-- Penjelasan: 
-- - Masuk ke dalam `List` terluar. Depth menjadi 2.
-- - Di depth 2, terdapat `Atom 'A'`. Karakter 'A' diulang 2 kali -> "AA".
-- - Di depth 2, terdapat `List` baru. Masuk ke list tersebut, depth naik menjadi 3.
-- - Di depth 3, terdapat `Atom 'B'`. Karakter 'B' diulang 3 kali -> "BBB".
-- - Dekripsi = "AA" ++ "BBB" = "AABBB".
--
-- > dekripsi (List [Atom 'A', List [Atom 'B'], Atom 'C'])
-- "AABBBCC"
