module Tomato.Bfs.Ver1 (bfsid) where

import Control.Monad.Trans.State
import qualified Data.Map as Map

import Tree
import Tomato.Dfs.Ver1

bfsid :: Tree a -> Tree (Int, a)
bfsid tree = go dfsTree
  where
    go :: Tree (Int, a) -> Tree (Int, a)
    go (Node (dfsId, v) ts) = Node (m Map.! dfsId, v) $ map go ts

    dfsTree = dfsid tree
    m = Map.fromList $ mkIdMap dfsTree

-- 深さ優先探索の id を 幅優先探索の id に紐付ける関数
mkIdMap :: Tree (Int, a) -> [(Int, Int)]
mkIdMap tree = evalState (go [tree]) 0
  where
    go :: [Tree (Int, a)] -> State Int [(Int, Int)]
    go [] = return []
    go (Node (dfsId,_v) ts : qs) = do
      bfsId <- get
      modify (+1)

      ids <- go (qs ++ ts)

      return $ (dfsId,bfsId) : ids