
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (cloneHelper 0 abs diff) @ l1
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

(8,7)-(8,31)
EMPTY
EmptyG

(8,7)-(8,36)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,8)-(8,19)
l1
VarG

(8,20)-(8,21)
clone 0 diff
AppG (fromList [VarG,LitG])

(8,22)-(8,25)
EMPTY
EmptyG

(8,34)-(8,36)
l2
VarG

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
