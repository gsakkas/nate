
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then List.append ((clone 0 (abs diff)), l1)
  else if diff > 0 then List.append ((clone 0 diff), l2);;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,7)-(10,18)
EMPTY
EmptyG

(10,7)-(10,45)
EMPTY
EmptyG

(10,21)-(10,26)
clone 0 (abs diff)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(11,7)-(11,56)
(l1 , l2)
TupleG (fromList [VarG])

(11,24)-(11,35)
EMPTY
EmptyG

(11,24)-(11,56)
EMPTY
EmptyG

(11,37)-(11,51)
l1
VarG

(11,38)-(11,43)
clone 0 diff
AppG (fromList [VarG,LitG])

*)
