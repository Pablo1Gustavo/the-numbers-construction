module Constructions.Numbers.Rational where

import Prelude hiding (Rational, floor, ceiling, truncate, round, (<*>))
import Constructions.Numbers.Natural (Nat(..))
import Constructions.Numbers.Integer (Z(..))
import qualified Constructions.Numbers.Integer as Z

-- Q a b represents a / b; every operation must reject a zero denominator.
data Q = Q Z Z
    deriving (Show)

instance Eq Q where
    -- Q a b == Q c d exactly when a*d == c*b, for nonzero denominators.
    (==) = undefined

instance Ord Q where
    (<=) = undefined

    min = undefined

    max = undefined

natToQ :: Nat -> Q
natToQ = zToQ . Z.natToZ

zToQ :: Z -> Q
zToQ z = Q z 1

-- Reduce by the GCD, keep the denominator positive and represent zero as 0/1.
normalize :: Q -> Q
normalize = undefined

isZero :: Q -> Bool
isZero = undefined

(<+>) :: Q -> Q -> Q
(<+>) = undefined

(<->) :: Q -> Q -> Q
(<->) = undefined

(<*>) :: Q -> Q -> Q
(<*>) = undefined

-- Exact division; the divisor must represent a nonzero rational.
(</>) :: Q -> Q -> Q
(</>) = undefined

-- Negative exponents require a nonzero base; use x^0 = 1.
(<^>) :: Q -> Z -> Q
(<^>) = undefined

-- Return -1, 0 or 1 as a rational, according to the sign.
sg :: Q -> Q
sg = undefined

-- Greatest integer <= x, represented as a rational with denominator 1.
floor :: Q -> Q
floor = undefined

-- Least integer >= x, represented as a rational with denominator 1.
ceiling :: Q -> Q
ceiling = undefined

-- Round toward zero, returning a rational with denominator 1.
truncate :: Q -> Q
truncate = undefined

-- Round to the nearest integer, ties to even; return a denominator of 1.
round :: Q -> Q
round = undefined

instance Num Q where
    (+) = (<+>)

    (*) = (<*>)

    (-) = (<->)

    negate = undefined

    abs = undefined

    signum = sg

    fromInteger = undefined

instance Fractional Q where
    (/) = (</>)

    -- The reciprocal is undefined for any representation of zero.
    recip = undefined

    -- Do not use this conversion to implement the exercises above.
    fromRational = undefined

infixl 6 <+>, <->
infixl 7 <*>, </>
infixr 8 <^>
