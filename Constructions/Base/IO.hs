module Constructions.Base.IO where

import Prelude hiding
    ( putStr
    , putStrLn
    , getLine
    , interact
    , (>>)
    , (>>=)
    , (<$)
    )

getLine :: IO String
getLine = undefined

getInt :: IO Int
getInt = undefined

-- Return Nothing for invalid or out-of-range integers.
getSafeInt :: IO (Maybe Int)
getSafeInt = undefined

-- With normal terminal buffering, reading a key may require pressing Enter.
pause :: IO ()
pause = undefined

skip :: IO ()
skip = undefined

newline :: IO ()
newline = undefined

-- Define using foldr.
putStr :: String -> IO ()
putStr = undefined

-- Print a newline after the action, preserving its result.
lnize :: (a -> IO b) -> a -> IO b
lnize = undefined

putStrLn :: String -> IO ()
putStrLn = lnize putStr

putCharLn :: Char -> IO ()
putCharLn = lnize putChar

-- Transform standard input through EOF and print the result.
interact :: (String -> String) -> IO ()
interact = undefined

perlineize :: (String -> String) -> String -> String
perlineize f = unlines . map f . lines

interactPerLine :: (String -> String) -> IO ()
interactPerLine = interact . perlineize

when :: Bool -> IO () -> IO ()
when = undefined

unless :: Bool -> IO () -> IO ()
unless = undefined

-- Succeed for True; fail with an IO error for False.
guard :: Bool -> IO ()
guard = undefined

forever :: IO a -> IO b
forever = undefined

-- Preserve effects and discard the result.
void :: IO a -> IO ()
void = undefined

-- Run the left action, discard its result, then run the right action.
(>>) :: IO a -> IO b -> IO b
(>>) = undefined

-- Pass the action's result to the next action.
(>>=) :: IO a -> (a -> IO b) -> IO b
(>>=) = undefined

-- Kleisli composition, left to right.
(>=>) :: (a -> IO b) -> (b -> IO c) -> a -> IO c
(>=>) = undefined

(<=<) :: (b -> IO c) -> (a -> IO b) -> a -> IO c
(<=<) = flip (>=>)

-- Preserve the action's effects, replacing its result with the supplied value.
($>) :: IO a -> b -> IO b
($>) = undefined

(<$) :: a -> IO b -> IO a
(<$) = undefined

ap :: IO (a -> b) -> IO a -> IO b
ap = undefined

iomap :: (a -> b) -> IO a -> IO b
iomap = undefined

joinIO :: IO (IO a) -> IO a
joinIO = undefined

-- Process lists from left to right; underscore variants discard results.
filterIO :: (a -> IO Bool) -> [a] -> IO [a]
filterIO = undefined

mapIO :: (a -> IO b) -> [a] -> IO [b]
mapIO = undefined

zipWithIO :: (a -> b -> IO c) -> [a] -> [b] -> IO [c]
zipWithIO = undefined

zipWithIO_ :: (a -> b -> IO c) -> [a] -> [b] -> IO ()
zipWithIO_ = undefined

sequenceIO :: [IO a] -> IO [a]
sequenceIO = undefined

sequenceIO_ :: [IO a] -> IO ()
sequenceIO_ = undefined

-- Nonpositive counts perform no actions.
replicateIO :: Integral i => i -> IO a -> IO [a]
replicateIO = undefined

replicateIO_ :: Integral i => i -> IO a -> IO ()
replicateIO_ = undefined

forIO :: [a] -> (a -> IO b) -> IO [b]
forIO = undefined

forIO_ :: [a] -> (a -> IO b) -> IO ()
forIO_ = undefined

foldlIO :: (b -> a -> IO b) -> b -> [a] -> IO b
foldlIO = undefined

foldlIO_ :: (b -> a -> IO b) -> b -> [a] -> IO ()
foldlIO_ = undefined

infixl 1 >>, >>=
infixr 1 >=>, <=<
infixl 4 $>, <$
