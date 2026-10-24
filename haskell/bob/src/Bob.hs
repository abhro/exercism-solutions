module Bob (responseFor) where

responseFor :: String -> String
responseFor xs
    | shouting && isQuestion = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | shouting = "Whoa, chill out!"
    | otherwise = "Whatever."
    where
        isQuestion = last xs == '?'
        shouting = all isUpper xs

isUpper :: Char -> Bool
isUpper c = 'A' < c && c < 'Z'
