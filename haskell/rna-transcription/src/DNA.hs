module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA [x] = fmap (\c -> [c]) $ toRNAChar x
toRNA (x:xs) = fmap (\x -> (toRNAChar x):xs) $ toRNA xs
-- toRNA (x:xs)
--     | x == 'G' = either Left (\rest -> Right ('C':rest)) $ toRNA xs
--     | x == 'C' = either Left (\rest -> Right ('G':rest)) $ toRNA xs
--     | x == 'T' = either Left (\rest -> Right ('A':rest)) $ toRNA xs
--     | x == 'A' = either Left (\rest -> Right ('U':rest)) $ toRNA xs
--     | otherwise = Left x


toRNAChar :: Char -> Either Char Char
toRNAChar 'G' = Right 'C'
toRNAChar 'C' = Right 'G'
toRNAChar 'T' = Right 'A'
toRNAChar 'A' = Right 'U'
toRNAChar x = Left x
