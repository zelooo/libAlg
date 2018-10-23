{-# LANGUAGE ParallelListComp #-}

import Data.Maybe
import GHC.Exts

type Vector a = [a]

{-
    ★  Using safe mode for all computation Maybe type.
        (Dont know whether it is necessary or not.
        But what if someone want a vector addition by
        the length of the vectors are not the same?
        Error should be given or the program will try
        something unwanted.)
-}

-- vector addition
vAdd :: (Num a) => Vector a -> Vector a -> Maybe (Vector a)
vAdd [] [] = Nothing
vAdd v1 v2
    | length v1 /= length v2 = Nothing
    | otherwise = Just ([ x1 + x2 | x1 <- v1 | x2 <- v2 ])

-- vector subtraction
vSub :: (Num a) => Vector a -> Vector a -> Maybe (Vector a)
vSub [] [] = Nothing
vSub v1 v2
    | length v1 /= length v2 = Nothing
    | otherwise = Just ([ x1 + x2 | x1 <- v1 | x2 <- v2 ])

-- vector scaler
vScaler :: (Num a) => Vector a -> a -> Maybe (Vector a)
vScaler [] _ = Nothing
vScaler v1 a = Just (map (*a) v1)
