module Darts (score) where

score :: Float -> Float -> Int
score x y
    | r > 10    = 0
    | r > 5     = 1
    | r > 1     = 5
    | otherwise = 10
    where r = hypot x y

hypot :: Floating a => a -> a -> a
hypot x y = sqrt $ x**2 + y**2
