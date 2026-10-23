module Constructions.Base.Maybe where

import Prelude hiding (maybe, Maybe(..))

data Maybe a = Nothing | Just a
    deriving (Show, Eq, Ord)

isJust, isNothing :: Maybe a -> Bool
isJust = undefined
isNothing = undefined

fromJust :: Maybe a -> a
fromJust = undefined

fromMaybe :: a -> Maybe a -> a
fromMaybe = undefined

maybe :: b -> (a -> b) -> Maybe a -> b
maybe = undefined

listToMaybe :: [a] -> Maybe a
listToMaybe = undefined

maybeToList :: Maybe a -> [a]
maybeToList = undefined

catMaybes :: [Maybe a] -> [a]
catMaybes = undefined

mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe = undefined

tryToModifyWith :: [Maybe (a -> a)] -> [a] -> [a]
tryToModifyWith = undefined
