module Acronym (abbreviate) where

import Data.Char       (toUpper)
import Text.Regex.PCRE (makeRegex)
import Text.Regex      (Regex, splitRegex, subRegex)

abbreviate :: String -> String
abbreviate s = map (toUpper . head) words
    where words = filter (not . null) (splitWords s)

splitWords :: String -> [String]
splitWords s = splitRegex _splitPattern (cleanString s)

_splitPattern :: Regex
_splitPattern = makeRegex "[-_ ]"

cleanString :: String -> String
cleanString s = subRegex _subPattern2 (subRegex _subPattern s "") "\\1 \\2"

_subPattern :: Regex
_subPattern = makeRegex "['_]"
_subPattern2 :: Regex
_subPattern2 = makeRegex "([^A-Z])([A-Z])"
