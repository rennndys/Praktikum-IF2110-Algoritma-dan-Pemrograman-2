module Pesta where

-- Pesta Eksklusif
-- DEFINISI DAN SPESIFIKASI
tamuEksklusif :: [Int] -> [Int] -> [Int]
-- tamuEksklusif menerima dua Himpunan ID tamu (berupa list of integer), lalu mengembalikan Himpunan baru yang berisi gabungan dari Tamu Eksklusif Mebel dan Tamu Eksklusif Pacific. Tamu Eksklusif adalah tamu yang hanya diundang oleh salah satu dari mereka saja, dan tidak diundang oleh keduanya (Symmetric Difference dari kedua himpunan). Urutannya adalah tamu eksklusif Mebel sesuai daftar Mebel, lalu tamu eksklusif Pacific sesuai daftar Pacific.

removeElement :: Int -> [Int] -> [Int]

-- REALISASI
tamuEksklusif mebel pacific
 | null mebel = pacific
 | null pacific = mebel
 | head mebel `notElem` pacific = (head mebel : tamuEksklusif (tail mebel) pacific)
 | otherwise = tamuEksklusif (tail mebel) (removeElement (head mebel) pacific)

removeElement x list
 | null list = []
 | x == head list = tail list
 | otherwise = (head list : removeElement x (tail list))

-- APLIKASI
-- > tamuEksklusif [1, 2, 3] [3, 4, 5]
-- [1, 2, 4, 5]
-- > tamuEksklusif [9, 8] [9, 8]
-- []
