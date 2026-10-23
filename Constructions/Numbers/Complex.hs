module Constructions.Numbers.Complex where

import Prelude hiding ((<*>))
import Constructions.Numbers.Integer (Z)
import Constructions.Numbers.Real (R)

-- C a b represents a + bi.
data C = C R R

-- No derived Show: display approximations of the real and imaginary parts.
-- No Eq: exact equality of real components is not generally decidable.
-- No Ord: no total order is compatible with the complex field operations.

realPart :: C -> R
realPart = undefined

imagPart :: C -> R
imagPart = undefined

rToC :: R -> C
rToC r = C r 0

i :: C
i = C 0 1

(<+>) :: C -> C -> C
(<+>) = undefined

(<->) :: C -> C -> C
(<->) = undefined

(<*>) :: C -> C -> C
(<*>) = undefined

-- The divisor must be nonzero; exact zero detection is not generally decidable.
(</>) :: C -> C -> C
(</>) = undefined

-- Negative exponents require a nonzero base; use z^0 = 1.
(<^>) :: C -> Z -> C
(<^>) = undefined

-- Conjugation changes the sign of the imaginary part.
conjugate :: C -> C
conjugate = undefined

-- Return a^2 + b^2 for C a b.
modulusSquared :: C -> R
modulusSquared = undefined

-- Return the nonnegative square root of modulusSquared.
modulus :: C -> R
modulus = undefined

-- Euclidean distance: |z - w|.
distance :: C -> C -> R
distance = undefined

-- For z = a + bi and w = c + di, return ac + bd.
dot :: C -> C -> R
dot = undefined

-- Return ad - bc, the signed area spanned by the two vectors.
det :: C -> C -> R
det = undefined

-- Rotate counterclockwise by 90 degrees around the origin.
rotate90 :: C -> C
rotate90 = undefined

midpoint :: C -> C -> C
midpoint = undefined

-- Return z / |z|; defined only for nonzero vectors.
normalize :: C -> C
normalize = undefined

instance Num C where
    (+) = (<+>)

    (*) = (<*>)

    (-) = (<->)

    negate = undefined

    abs = rToC . modulus

    -- z / |z| for nonzero z, zero otherwise; not generally computable at zero.
    signum = undefined

    fromInteger = rToC . fromInteger

instance Fractional C where
    (/) = (</>)

    -- Defined only for nonzero complex numbers.
    recip = undefined

    fromRational = rToC . fromRational

infixl 6 <+>, <->
infixl 7 <*>, </>
infixr 8 <^>
