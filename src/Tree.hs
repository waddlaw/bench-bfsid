{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE StrictData #-}
module Tree (Tree (..), exTree, mkTree) where

import Control.DeepSeq
import GHC.Generics

data Tree a = Node a [Tree a]
  deriving (Eq, Show, Generic)

instance NFData a => NFData (Tree a)

exTree :: Tree String 
exTree =
  Node "aaa"
    [ Node "bbb"
        [ Node "ddd"
            [ Node "fff" [] ]
        , Node "ggg" []
        ]
    , Node "ccc"
        [ Node "eee" [] ]
    , Node "xxx" []
    ]

mkTree :: Int -> Int -> Tree ()
mkTree w 0 = Node () []
mkTree w d = Node () $ replicate w $ mkTree w (d-1)