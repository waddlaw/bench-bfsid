{-# LANGUAGE ScopedTypeVariables #-}
module Joe.Bfs.Ver1 (bfsid) where

import Data.Foldable
import Data.Sequence (Seq)
import qualified Data.Sequence as Seq

import Tree

bfsid :: forall a. Tree a -> Tree (Int, a)
bfsid = flip Seq.index 0 . recur 0 . Seq.singleton
  where
    recur :: Int -> Seq (Tree a) -> Seq (Tree (Int,a))
    recur _ Seq.Empty = Seq.Empty
    recur k (Node x ts Seq.:<| tq) = n1 Seq.<| q1
      where
        n1 :: Tree (Int,a)
        n1 = Node (k,x) (toList q2)

        (q1,q2) = Seq.splitAt (Seq.length tiaq - length ts) tiaq

        tiaq :: Seq (Tree (Int,a))
        tiaq = recur (succ k) (tq Seq.>< Seq.fromList ts)