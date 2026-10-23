module Constructions.Base.Bool where

import Prelude hiding
    ( Bool(..)
    , not
    , (&&)
    , (||)
    , and
    , or
    , all
    , any
    )

data Bool = False | True

instance Show Bool where
    show = undefined

instance Enum Bool where
    toEnum = undefined

    fromEnum = undefined

-- NOT
not :: Bool -> Bool
not = undefined

-- IF / THEN / ELSE
ifThenElse :: Bool -> a -> a -> a
ifThenElse = undefined

-- AND
(&&) :: Bool -> Bool -> Bool
(&&) = undefined

-- OR
(||) :: Bool -> Bool -> Bool
(||) = undefined

-- NAND
(/|\) :: Bool -> Bool -> Bool
(/|\) = undefined

-- NOR
(\|/) :: Bool -> Bool -> Bool
(\|/) = undefined

-- XOR
(<=/=>) :: Bool -> Bool -> Bool
(<=/=>) = undefined

-- Implication
(==>) :: Bool -> Bool -> Bool
(==>) = undefined

-- Reverse implication
(<==) :: Bool -> Bool -> Bool
(<==) = undefined

-- Equivalence
(<=>) :: Bool -> Bool -> Bool
(<=>) = undefined

infixr 3 &&
infixr 2 ||
infixr 2 /|\
infixr 2 \|/
infixr 2 <=/=>
infixr 1 ==>
infixl 1 <==
infixr 1 <=>
