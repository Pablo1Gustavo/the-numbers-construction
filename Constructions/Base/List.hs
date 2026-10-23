module Constructions.Base.List where

import Prelude hiding
    ( String
    , head, tail, null, length, sum, product, minimum, maximum
    , reverse, (++), take, drop, takeWhile, dropWhile, init
    , any, all, and, or, concat, elem, (!!), filter, map
    , cycle, repeat, replicate, zip, zipWith, splitAt, break
    , lines, words, unlines, unwords
    )

data List a = Nil | Const a (List a)
    deriving (Show, Eq, Ord)

type String = List Char

-- head and tail are undefined for Nil.
head :: List a -> a
head = undefined

tail :: List a -> List a
tail = undefined

null :: List a -> Bool
null = undefined

length :: Integral i => List a -> i
length = undefined

sum :: Num a => List a -> a
sum = undefined

product :: Num a => List a -> a
product = undefined

-- minimum and maximum require a nonempty list.
minimum :: Ord a => List a -> a
minimum = undefined

maximum :: Ord a => List a -> a
maximum = undefined

reverse :: List a -> List a
reverse = undefined

(++) :: List a -> List a -> List a
(++) = undefined

-- Append one element to the end.
snoc :: a -> List a -> List a
snoc = undefined

(<:) :: List a -> a -> List a
(<:) = flip snoc

-- Implement concatenation using snoc instead of (++).
(+++) :: List a -> List a -> List a
(+++) = undefined

-- Nonpositive counts behave as zero.
take :: Integral i => i -> List a -> List a
take = undefined

drop :: Integral i => i -> List a -> List a
drop = undefined

takeWhile :: (a -> Bool) -> List a -> List a
takeWhile = undefined

dropWhile :: (a -> Bool) -> List a -> List a
dropWhile = undefined

-- Include Nil among the suffixes and prefixes.
tails :: List a -> List (List a)
tails = undefined

-- Remove the last element; undefined for Nil.
init :: List a -> List a
init = undefined

inits :: List a -> List (List a)
inits = undefined

-- Include the empty subsequence; preserve element order.
subsequences :: List a -> List (List a)
subsequences = undefined

any :: (a -> Bool) -> List a -> Bool
any = undefined

all :: (a -> Bool) -> List a -> Bool
all = undefined

and :: List Bool -> Bool
and = undefined

or :: List Bool -> Bool
or = undefined

concat :: List (List a) -> List a
concat = undefined

-- Define using any.
elem :: Eq a => a -> List a -> Bool
elem = undefined

-- Define recursively, using only (==) for element comparison.
elem' :: Eq a => a -> List a -> Bool
elem' = undefined

-- Zero-based indexing; negative and out-of-range indices are undefined.
(!!) :: Integral i => List a -> i -> a
(!!) = undefined

filter :: (a -> Bool) -> List a -> List a
filter = undefined

map :: (a -> b) -> List a -> List b
map = undefined

-- Repeat a nonempty list indefinitely; undefined for Nil.
cycle :: List a -> List a
cycle = undefined

repeat :: a -> List a
repeat = undefined

-- Nonpositive counts produce Nil.
replicate :: Integral i => i -> a -> List a
replicate = undefined

isPrefixOf :: Eq a => List a -> List a -> Bool
isPrefixOf = undefined

isInfixOf :: Eq a => List a -> List a -> Bool
isInfixOf = undefined

isSuffixOf :: Eq a => List a -> List a -> Bool
isSuffixOf = undefined

-- Stop when either list ends.
zip :: List a -> List b -> List (a, b)
zip = undefined

zipWith :: (a -> b -> c) -> List a -> List b -> List c
zipWith = undefined

intercalate :: List a -> List (List a) -> List a
intercalate = undefined

-- Remove duplicates, keeping their first occurrence.
nub :: Eq a => List a -> List a
nub = undefined

-- Split in one traversal; nonpositive counts leave the input in the second part.
splitAt :: Integral i => i -> List a -> (List a, List a)
splitAt = undefined

-- Split before the first element satisfying the predicate.
break :: (a -> Bool) -> List a -> (List a, List a)
break = undefined

-- Split at newlines; a final newline does not add an extra trailing line.
lines :: String -> List String
lines = undefined

-- Split at whitespace, discarding empty words.
words :: String -> List String
words = undefined

-- Append a newline to every line, including the last.
unlines :: List String -> String
unlines = undefined

unwords :: List String -> String
unwords = undefined

-- Swap rows and columns, skipping missing entries in ragged rows.
transpose :: List (List a) -> List (List a)
transpose = undefined

-- Compare letters only, ignoring case: "Madam, I'm Adam" is a palindrome.
palindrome :: String -> Bool
palindrome = undefined

infixr 5 ++
infixl 5 +++, <:
infixl 9 !!
