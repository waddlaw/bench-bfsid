module Tomato.Dfs.Ver1 (dfsid) where

import Control.Monad.Trans.State

import Tree

dfsid :: Tree a -> Tree (Int, a)
dfsid tree = evalState (go tree) 0
  where
    go :: Tree a -> State Int (Tree (Int, a))
    go (Node v ts) = do
      idx <- get
      modify (+1)

      ts' <- mapM go ts

      return $ Node (idx,v) ts'