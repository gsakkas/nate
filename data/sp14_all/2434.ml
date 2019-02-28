
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (([0] @ l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,52)-(5,62)
l1
VarG

(5,7)-(5,67)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (5,52)-(5,54)) "l1"
Tuple (Just (5,65)-(5,73)) [Var (Just (5,66)-(5,68)) "l1",Var (Just (5,70)-(5,72)) "l2"]
*)

(* typed spans
(5,52)-(5,54)
(5,65)-(5,73)
*)

(* correct types
'a list
('a list * 'b list)
*)

(* bad types
int list
unit
*)
