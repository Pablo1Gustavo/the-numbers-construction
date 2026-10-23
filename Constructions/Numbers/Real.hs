module Constructions.Numbers.Real where

import Prelude hiding (Real, pi, sqrt, exp, sin, cos, tan, (<*>))
import Constructions.Numbers.Natural (Nat(..))
import Constructions.Numbers.Integer (Z)
import Constructions.Numbers.Rational (Q)
import qualified Constructions.Numbers.Rational as Q

-- Only Cauchy sequences are valid; equivalent sequences differ by a null sequence.
-- No fixed convergence rate is required, and arbitrary sequences cannot be validated.
newtype R = R (Nat -> Q)

-- Display
-- No derived Show for functions; display selected rational approximations instead.

-- Equality and ordering
-- No Eq or Ord: exact comparison of limits is not generally decidable.
-- Comparing finitely many terms cannot determine equality or order in general.

-- An index selects a term, not a guaranteed number of accurate digits.
approximate :: Nat -> R -> Q
approximate = undefined

qToR :: Q -> R
qToR q = R (const q)

natToR :: Nat -> R
natToR = qToR . Q.natToQ

zToR :: Z -> R
zToR = qToR . Q.zToQ

-- Define arithmetic term by term; preserve equivalence of representatives.
(<+>) :: R -> R -> R
(<+>) = undefined

(<->) :: R -> R -> R
(<->) = undefined

(<*>) :: R -> R -> R
(<*>) = undefined

-- A nonzero divisor may have zero terms; handle a finite initial prefix.
(</>) :: R -> R -> R
(</>) = undefined

-- Negative exponents require a nonzero base; use x^0 = 1.
(<^>) :: R -> Z -> R
(<^>) = undefined

absDiff :: R -> R -> R
absDiff = undefined

(|-|) :: R -> R -> R
(|-|) = absDiff

-- Return rational approximations converging to the nonnegative square root.
sqrtQ :: Q -> R
sqrtQ = undefined

-- Require a nonnegative limit; its representative may contain negative terms.
sqrt :: R -> R
sqrt = undefined

-- Sum the initial term and n further terms; next receives a one-based index.
series :: Nat -> (Q -> Q -> Q) -> Q -> Q
series n next first = go n 1 first first
  where
    go :: Nat -> Q -> Q -> Q -> Q
    go Zero _ _ total = total
    go (Succ remaining) k term total =
        let following = next k term
        in go remaining (k + 1) following (total + following)

-- Leibniz partial sums: 4, 8/3, 52/15, ...; convergence is slow.
pi :: R
pi = R (\n ->
    4 * series n (\k term -> negate term * (2*k - 1) / (2*k + 1)) 1)

-- Factorial series partial sums: 1, 2, 5/2, 8/3, ...
e :: R
e = R (\n -> series n (flip (/)) 1)

-- Taylor partial sums converge uniformly on bounded intervals.
exp :: R -> R
exp (R x) = R (\n ->
    let q = x n
    in series n (\k term -> term * q / k) 1)

-- Angles are in radians.
sin :: R -> R
sin (R x) = R (\n ->
    let q = x n
        qSquared = q * q
    in series n
        (\k term -> negate term * qSquared / ((2*k) * (2*k + 1)))
        q)

cos :: R -> R
cos (R x) = R (\n ->
    let q = x n
        qSquared = q * q
    in series n
        (\k term -> negate term * qSquared / ((2*k - 1) * (2*k)))
        1)

-- Defined only when cos x is nonzero.
tan :: R -> R
tan x = sin x / cos x

-- Ratios of consecutive Fibonacci numbers: 1, 2, 3/2, 5/3, ...
phi :: R
phi = R (\n -> ratio n 1 1)
  where
    ratio :: Nat -> Q -> Q -> Q
    ratio Zero a b = b / a
    ratio (Succ n) a b = ratio n b (a + b)

instance Num R where
    (+) = (<+>)

    (*) = (<*>)

    (-) = (<->)

    negate = undefined

    abs = undefined

    -- Exact signum is not generally computable at zero.
    signum = undefined

    fromInteger = qToR . fromInteger

instance Fractional R where
    (/) = (</>)

    -- Defined only for nonzero limits; exact zero detection is not decidable.
    recip = undefined

    fromRational = qToR . fromRational

infixl 6 <+>, <->
infixl 7 <*>, </>
infixr 8 <^>
infixl 6 |-|, `absDiff`
