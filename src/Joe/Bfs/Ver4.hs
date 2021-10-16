module Joe.Bfs.Ver4 (bfsid) where

import Data.Sequence (Seq)
import qualified Data.Sequence as Seq

import Tree

bfsid :: Tree a -> Tree (Int,a)
bfsid = head . iter 0 . Seq.singleton
  where
    iter :: Int -> Seq (Tree a) -> [Tree (Int, a)]
    iter _ Seq.Empty = []
    iter k (Node x ts Seq.:<| tqueue) = n1 : tias1
      where
        n1 = Node (k,x) $ take (length ts) $ drop (Seq.length tqueue) tias1
        tias1 = iter (succ k) (tqueue Seq.>< Seq.fromList ts)