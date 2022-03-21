module Main where

import Data.Char (digitToInt)
import Data.List (tails)

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

-- Exercicio 5
lcsm' :: [Int] -> Int
lcsm' = foldr lcm 1

resultLcsm' :: Int
resultLcsm' = lcsm'[1..20]

-- Exercicio 6
sumSquare' :: Num a => [a] -> a
sumSquare' [] = 0
sumSquare' (x : xs) = x^2 + sumSquare' xs

squareSum' :: Num a => [a] -> a
squareSum' [] = 0
squareSum' (x : xs) = x + squareSum' xs
--squareSum' [1,2..100]^2 - sumSquare'[1,2..100]

-- Exercicio 7
primes :: [Integer]
primes = 2 : filter ((==1) . length . primeFactors) [3,5..]

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes
  where
    factor n (x:xs)
        | x*x > n        = [n]
        | n `mod` x == 0 = x : factor (n `div` x) (x:xs)
        | otherwise      = factor n xs

finalPrime :: Integer
finalPrime = primes !! 10000

-- Exercicio 8
problem_8 :: IO ()
problem_8 = do str <- getLine
               --7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450
               -- roda o programa e coloca os numeros
               let number = map digitToInt (concat $ lines str)
               print $ maximum $ map (product . take 13) (tails number)

-- Exercicio 9
--https://www.mathblog.dk/pythagorean-triplets/
triplet :: Integral a => a -> [[a]]
triplet l = [[a,b,c] | m <- [2..],
                        n <- [1..(m-1)],
                        let a = m^2 - n^2,
                        let b = 2*m*n,
                        let c = m^2 + n^2,
                        a+b+c==l]
    where limit = floor . sqrt . fromIntegral $ l

pythagorean :: Integer
pythagorean = product . head . triplet $ 1000

-- Exercicio 10
-- usar a funcao primes do exercicio 7
belowTwoMillion :: Integer
belowTwoMillion = sum (takeWhile (< 2000000) primes)

main :: IO ()
main = putStrLn "Hello, world!"
