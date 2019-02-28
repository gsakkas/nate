
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,20)-(2,72)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (3,60)-(3,68)) [Var (Just (3,61)-(3,63)) "l1",Var (Just (3,65)-(3,67)) "l2"]
*)

(* typed spans
(3,60)-(3,68)
*)

(* correct types
('a list * 'b list)
*)

(* bad types
unit
*)
