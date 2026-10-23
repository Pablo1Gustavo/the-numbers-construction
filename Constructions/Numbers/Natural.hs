module Constructions.Numbers.Natural where

import Prelude hiding (pred, even, odd, (<*>))

data Nat = Zero | Succ Nat

instance Show Nat where
    -- Show Zero as O and Succ (Succ (Succ Zero)) as SSSO.
    show = undefined

instance Eq Nat where
    (==) = undefined

instance Ord Nat where
    (<=) = undefined

    -- Define min and max without using (<=).
    min = undefined

    max = undefined

isZero :: Nat -> Bool
isZero = undefined

-- The predecessor of Zero is Zero.
pred :: Nat -> Nat
pred = undefined

even :: Nat -> Bool
even = undefined

odd :: Nat -> Bool
odd = undefined

(<+>) :: Nat -> Nat -> Nat
(<+>) = undefined

-- Monus: subtraction returns Zero when the result would be less than Zero.
(<->) :: Nat -> Nat -> Nat
(<->) = undefined

(<*>) :: Nat -> Nat -> Nat
(<*>) = undefined

-- Integer quotient rounded down: 7 / 2 = 3. Division by Zero is undefined.
(</>) :: Nat -> Nat -> Nat
(</>) = undefined

-- For b > 0, a = (a </> b) * b + (a <%> b), with 0 <= a <%> b < b.
-- Remainder with a Zero divisor is undefined.
(<%>) :: Nat -> Nat -> Nat
(<%>) = undefined

(<^>) :: Nat -> Nat -> Nat
(<^>) = undefined

-- a <|> b tests whether a divides b.
(<|>) :: Nat -> Nat -> Bool
(<|>) = undefined

divides :: Nat -> Nat -> Bool
divides = (<|>)

-- Absolute difference: the distance between the operands, regardless of order.
absDiff :: Nat -> Nat -> Nat
absDiff = undefined

(|-|) :: Nat -> Nat -> Nat
(|-|) = absDiff

factorial :: Nat -> Nat
factorial = undefined

-- Return Zero for zero and Succ Zero for positive numbers.
sg :: Nat -> Nat
sg = undefined

-- Do not use these conversions to implement the exercises above.
toNat :: Integral a => a -> Nat
toNat = undefined

fromNat :: Integral a => Nat -> a
fromNat = undefined

instance Num Nat where
    (+) = (<+>)
    (*) = (<*>)
    (-) = (<->)
    abs n = n
    signum = sg
    fromInteger = undefined

infixl 6 <+>, <->
infixl 7 <*>, </>, <%>
infixr 8 <^>
infix 4 <|>, `divides`
infixl 6 |-|, `absDiff`
