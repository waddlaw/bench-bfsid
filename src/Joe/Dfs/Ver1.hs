module Joe.Dfs.Ver1 (dfsid) where

import Data.List

import Tree

dfsid :: Tree a -> Tree (Int, a)
dfsid = snd . recur 0
  where
    recur :: Int -> Tree a -> (Int, Tree (Int, a))
    recur k (Node x ts) = fmap (Node (k, x)) $ mapAccumL recur (succ k) ts