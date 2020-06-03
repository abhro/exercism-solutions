module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map,fromList,adjust)
import Data.Set (Set,fromList,member)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts "" = Right $ Data.Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
nucleotideCounts (x:xs)
    | not (all) = Left ""
    | otherwise = Right $ adjust (+1) a (nucleotideCounts xs)
        where a = parseNucleotide x

isValidDNAString :: String -> Bool
isValidDNAString s = all (`Data.Set.member` allowedNucleotides) s
    where allowedNucleotides = Data.Set.fromList(['A', 'C', 'G', 'T'])

parseNucleotide :: Char -> Maybe Nucleotide
parseNucleotide 'A' = Just A
parseNucleotide 'C' = Just C
parseNucleotide 'G' = Just G
parseNucleotide 'T' = Just T
parseNucleotide _ = Nothing
