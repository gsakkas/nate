
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then 0 :: l1;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,51)-(5,58)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (5,51)-(5,59)) [Var (Just (5,52)-(5,54)) "l1",Var (Just (5,56)-(5,58)) "l2"]
*)

(* typed spans
(5,51)-(5,59)
*)

(* correct types
('a list * 'b list)
*)

(* bad types
int list
*)
