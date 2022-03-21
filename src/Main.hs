module Main where

-- Exercicio 1
multiples' :: [Integer]
multiples' = [x | x <- [0 .. 999], x `mod` 3 == 0 || x `mod` 5 == 0]

sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x : xs) = x + sumList xs
-- ghci -> sumList multiples'

-- Exercicio 2
fibonacci :: (Num a1, Num a2, Ord a1) => a1 -> a2
fibonacci 1 = 1
fibonacci 2 = 2
fibonacci n
    | n >= 3    = fibonacci (n - 1) + fibonacci (n - 2) 
    | otherwise = fibonacci 2 + fibonacci 1

fibonacciList :: [Integer]
fibonacciList = [fibonacci i | i <- [1..32]]

evenFibonacci :: [Integer]
evenFibonacci = [x | x <- fibonacciList, x `mod` 2 == 0]

evenFibonacci' :: [Integer]
evenFibonacci' = [x' | x' <- evenFibonacci, x' <= 4000000]

sumEvenFibonacci' :: Integer
sumEvenFibonacci' = sum evenFibonacci'

-- Exercicio 3
largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n
  | n <= 1    = error "n <= 1"
  | otherwise = largestPrimeFactor' n (2 : [3, 5..])
  where
    largestPrimeFactor' n pseudoprimeCandidates@(x:xs)
      | x * x >= n = n
      | m == 0     = largestPrimeFactor' d pseudoprimeCandidates
      | otherwise  = largestPrimeFactor' n xs
      where
        (d, m) = divMod n x

-- Exercicio 4
isPalindrome :: Integer -> Bool
isPalindrome n = let s = show n in s == reverse s

palindrome' :: Integer
palindrome' =  maximum  [x*y | x <- [100..999], y <- [100..999]
                       , x >= y
                       , isPalindrome (x*y)]

main :: IO ()
main = putStrLn "Hello, world!"
