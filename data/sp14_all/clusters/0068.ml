LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
let (pos , total) = a in
(pos , l2)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
let (h :: t , _) = a in
([] , [])
let (one , two) = a in
(x :: one , y :: two)
