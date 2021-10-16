module Main (main) where

import Joe.Bfs.Ver1
import Tree

main :: IO ()
main = print $ bfsid $ mkTree 5 5