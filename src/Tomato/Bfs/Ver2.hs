module Tomato.Bfs.Ver2 (bfsid) where

import Tree

bfsid :: Tree a -> Tree (Int, a)
bfsid tree = head $ helper2 [1] ns $ zip [0..] es
  where
    (ns, es) = helper1 [tree]

-- >>> helper1 [exTree]
-- ([3,2,1,0,1,0,0,0],["aaa","bbb","ccc","xxx","ddd","ggg","eee","fff"])
helper1 :: [Tree a] -> ([Int], [a])
helper1 [] = ([], [])
helper1 (Node v ts : qs) = let (ls, vs) = helper1 (qs ++ ts) in (length ts:ls, v:vs)

helper2 :: [Int] -> [Int] -> [(Int, a)] -> [Tree (Int, a)]
helper2 _ [] _ = []
helper2 ns ms xs =
  let n = sum ns
      (ys, ys') = splitAt n xs
      (ls, ls') = splitAt n ms
      zs = chop ls $ helper2 ls ls' ys'
   in zipWith Node ys zs

-- >>> chop [1,2,3] [1,1,1,1,1,1]
-- [[1],[1,1],[1,1,1]]
chop :: [Int] -> [a] -> [[a]]
chop [] _ = []
chop (n:ns) xs = take n xs : chop ns (drop n xs)
