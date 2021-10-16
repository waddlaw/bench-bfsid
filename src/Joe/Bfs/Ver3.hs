module Joe.Bfs.Ver3 (bfsid) where

import Tree

bfsid :: Tree a -> Tree (Int,a)
bfsid t = head tiasN
  where
    (tiasN,tqueue) = iter 0 tiasN 1 (t:tqueue)
    -- iter :: Int -- k : キューの先頭の木につくid
    --      -> [Tree (Int,a)] -- tias : drop k tiasN この先頭はこの呼び出しが作るTree (Int,a)
    --      -> Int -- len : キューの長さ
    --      -> [Tree a] -- (Node x ts):tqueue : 今回処理するべき木 : 続けて処理するべき木のbfsキュー
    --      -> ([Tree (Int,a)] -- ここから先の分の結果 つまり引数tiasと等しい
    --      -- ,[Tree a])  -- 木のbfsキュー
    iter :: Int -> [Tree (Int, a)] -> Int -> [Tree a] -> ([Tree (Int, a)], [Tree a])
    iter _ _ 0 _ = ([], undefined)
    iter k tias len (Node x ts:tqueue) = (n1 : tias1, ts ++ tqueue2)
      where
        lts = length ts
        n1 = Node (k,x) $ take lts $ drop len tias
        (tias1, tqueue2) = iter (succ k) (tail tias) (pred len + lts) tqueue