module Main (main) where

import Tomato.Bfs.Ver1
import Tree

main :: IO ()
main = print $ bfsid $ mkTree 5 5