module Main where

-- Exercicio 1
multiplos' :: [Integer]
multiplos' = [x | x <- [0 .. 999], x `mod` 3 == 0 || x `mod` 5 == 0]

somaLista :: Num a => [a] -> a
somaLista [] = 0
somaLista (x : xs) = x + somaLista xs

main :: IO ()
main = putStrLn "hello, world!"
