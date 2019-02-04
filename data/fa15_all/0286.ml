
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) (l1 @ 0)
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(5,12)-(9,49)
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
LamG (LamG EmptyG)

(8,7)-(8,18)
EMPTY
EmptyG

(8,7)-(8,49)
EMPTY
EmptyG

(8,19)-(8,20)
EMPTY
EmptyG

(8,21)-(8,40)
EMPTY
EmptyG

(8,22)-(8,35)
EMPTY
EmptyG

(8,23)-(8,27)
EMPTY
EmptyG

(8,30)-(8,34)
EMPTY
EmptyG

(8,38)-(8,39)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,47)-(8,48)
clone 0 diff
AppG (fromList [VarG,LitG])

(9,7)-(9,49)
EMPTY
EmptyG

(9,24)-(9,44)
l2
VarG

(9,24)-(9,49)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,25)-(9,36)
clone
VarG

(9,47)-(9,49)
(l1 , l2)
TupleG (fromList [VarG])

*)
