LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let subtreeSize1 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize2 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize3 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeeSize4 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let x = rand (1 , 5) in
match x with
| _ -> buildSine (build (rand , subtreeSize1))
