LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
let sum =
  fst a + ((fst x + snd x) mod 10) in
(sum / 10 , sum mod 10)
let xx = (x * x) * x in
(xx , xx < 100)
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
