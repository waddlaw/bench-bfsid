module Main (main) where

import System.Environment

import Tomato.Bfs.Ver1
import Tree

main :: IO ()
main = do
  [w,d] <- getArgs
  print $ bfsid $ mkTree (read w) (read d)