
let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then List.combine l1 l2;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(3,46)-(3,64)
(l1 , l2)
TupleG (fromList [VarG])

(3,2)-(3,64)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (3,46)-(3,54)) [Var (Just (3,47)-(3,49)) "l1",Var (Just (3,51)-(3,53)) "l2"]
Tuple (Just (3,60)-(3,68)) [Var (Just (3,61)-(3,63)) "l1",Var (Just (3,65)-(3,67)) "l2"]
*)

(* typed spans
(3,46)-(3,54)
(3,60)-(3,68)
*)

(* correct types
('a list * 'b list)
('a list * 'b list)
*)

(* bad types
('a * 'b) list
unit
*)
