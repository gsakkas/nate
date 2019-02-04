
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then ((List.append [0] l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,7)-(5,77)
(l1 , l2)
TupleG (fromList [VarG])

(5,52)-(5,72)
EMPTY
EmptyG

(5,53)-(5,64)
EMPTY
EmptyG

(5,65)-(5,68)
EMPTY
EmptyG

(5,66)-(5,67)
EMPTY
EmptyG

*)
