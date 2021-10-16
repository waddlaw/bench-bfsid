module Main (main) where

import Test.Tasty.Bench

import Tree

import Joe.Bfs.Ver1
import Joe.Bfs.Ver2
import Joe.Bfs.Ver3
import Joe.Bfs.Ver4
import Joe.Dfs.Ver1

import Tomato.Bfs.Ver1
import Tomato.Bfs.Ver2
import Tomato.Dfs.Ver1

main :: IO ()
main = do
  let smallTree = exTree
      bigTree = mkTree 5 5
  defaultMain
    [ bgroup "bfsid (small tree)"
      [ bench "Joe bfs1"     $ nf Joe.Bfs.Ver1.bfsid smallTree
      , bench "Joe bfs2"     $ nf Joe.Bfs.Ver2.bfsid smallTree
      , bench "Joe bfs3"     $ nf Joe.Bfs.Ver3.bfsid smallTree
      , bench "Joe bfs4"     $ nf Joe.Bfs.Ver4.bfsid smallTree
      -- tomato version
      , bench "Tomato bfs1"  $ nf Tomato.Bfs.Ver1.bfsid smallTree
      , bench "Tomato bfs2"  $ nf Tomato.Bfs.Ver2.bfsid smallTree
      ]
    , bgroup "bfsid (big tree)"
      [ bench "Joe bfs1"     $ nf Joe.Bfs.Ver1.bfsid bigTree
      , bench "Joe bfs2"     $ nf Joe.Bfs.Ver2.bfsid bigTree
      , bench "Joe bfs3"     $ nf Joe.Bfs.Ver3.bfsid bigTree
      , bench "Joe bfs4"     $ nf Joe.Bfs.Ver4.bfsid bigTree
      -- tomato version
      , bench "Tomato bfs1"  $ nf Tomato.Bfs.Ver1.bfsid bigTree
      , bench "Tomato bfs2"  $ nf Tomato.Bfs.Ver2.bfsid bigTree
      ]
    , bgroup "dfsid (small tree)"
      [ bench "Joe dfs1"     $ nf Joe.Dfs.Ver1.dfsid smallTree
      , bench "Tomato dfs1"  $ nf Tomato.Dfs.Ver1.dfsid smallTree
      ]
    , bgroup "dfsid (big tree)"
      [ bench "Joe dfs1"     $ nf Joe.Dfs.Ver1.dfsid bigTree
      , bench "Tomato dfs1"  $ nf Tomato.Dfs.Ver1.dfsid bigTree
      ]
    ]