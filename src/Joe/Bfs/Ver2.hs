{-# LANGUAGE ScopedTypeVariables #-}
module Joe.Bfs.Ver2 (bfsid) where

import Data.Foldable
import Data.Sequence (Seq)
import qualified Data.Sequence as Seq

import Tree

bfsid :: forall a. Tree a -> Tree (Int, a)
bfsid t = head tias
  where
    tias :: [Tree (Int, a)]
    tias = snd $ recur 0 $ Seq.singleton t

    recur :: Int -> Seq.Seq (Tree a) -> (Int, [Tree (Int,a)])
    recur k Seq.Empty = (k, []) -- = ノード数 = length tias
    recur k (Node x ts Seq.:<| tq) = (len2, n1 : tias1)
      where
        (len, tias1) = recur (succ k) (tq Seq.>< Seq.fromList ts)
        l = length ts
        len2 = len - l
        n1 = Node (k,x) $ take l $ drop len2 tias