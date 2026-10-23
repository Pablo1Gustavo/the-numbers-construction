module Constructions.Base.Either where

import Prelude hiding (either, Either(..))

data Either a b = Left a | Right b
    deriving (Show, Eq)

isLeft, isRight :: Either a b -> Bool
isLeft = undefined
isRight = undefined

fromLeft :: a -> Either a b -> a
fromLeft = undefined

fromRight :: b -> Either a b -> b
fromRight = undefined

either :: (a -> c) -> (b -> c) -> Either a b -> c
either = undefined

lefts :: [Either a b] -> [a]
lefts = undefined

rights :: [Either a b] -> [b]
rights = undefined

partitionEithers :: [Either a b] -> ([a], [b])
partitionEithers = undefined
