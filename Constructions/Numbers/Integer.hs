module Constructions.Numbers.Integer where

import Prelude hiding (even, odd, gcd, lcm, (<*>))
import Constructions.Numbers.Natural (Nat(..))

-- Z a b represents a - b; different pairs may represent the same integer.
data Z = Z Nat Nat
    deriving (Show)

instance Eq Z where
    -- Z a b == Z c d exactly when a + d == c + b.
    (==) = undefined

instance Ord Z where
    (<=) = undefined

    min = undefined

    max = undefined

natToZ :: Nat -> Z
natToZ n = Z n 0

-- Return an equivalent pair with at least one Zero component.
normalize :: Z -> Z
normalize = undefined

isZero :: Z -> Bool
isZero = undefined

even :: Z -> Bool
even = undefined

odd :: Z -> Bool
odd = undefined

(<+>) :: Z -> Z -> Z
(<+>) = undefined

(<->) :: Z -> Z -> Z
(<->) = undefined

(<*>) :: Z -> Z -> Z
(<*>) = undefined

-- Euclidean quotient: a = b*q + r with 0 <= r < abs b, even for negative b.
-- Division by any representation of zero is undefined.
(</>) :: Z -> Z -> Z
(</>) = undefined

-- Euclidean remainder: 0 <= a <%> b < abs b; a zero divisor is undefined.
(<%>) :: Z -> Z -> Z
(<%>) = undefined

-- The exponent is natural; use x^0 = 1.
(<^>) :: Z -> Nat -> Z
(<^>) = undefined

-- a <|> b means b = a*k for some integer k; zero divides only zero.
(<|>) :: Z -> Z -> Bool
(<|>) = undefined

divides :: Z -> Z -> Bool
divides = (<|>)

-- Return the distance as a natural number.
absDiff :: Z -> Z -> Nat
absDiff = undefined

(|-|) :: Z -> Z -> Nat
(|-|) = absDiff

-- Return -1, 0 or 1 according to the sign of the integer.
sg :: Z -> Z
sg = undefined

-- Return a nonnegative result; gcd 0 0 = 0.
gcd :: Z -> Z -> Z
gcd = undefined

-- Return a nonnegative result; lcm a 0 = lcm 0 a = 0.
lcm :: Z -> Z -> Z
lcm = undefined

-- Do not use these conversions to implement the exercises above.
toZ :: Integral a => a -> Z
toZ = undefined

fromZ :: Integral a => Z -> a
fromZ = undefined

instance Num Z where
    (+) = (<+>)

    (*) = (<*>)

    (-) = (<->)

    negate = undefined

    abs = undefined

    signum = sg

    fromInteger = undefined

infixl 6 <+>, <->
infixl 7 <*>, </>, <%>
infixr 8 <^>
infix 4 <|>, `divides`
infixl 6 |-|, `absDiff`
