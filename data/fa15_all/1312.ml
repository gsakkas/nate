
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0 then (l1, l2) else if difference2 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0
  then (l1, l2)
  else if difference2 > 0 then (l1, l2) else (l1, l2);;

*)

(* changed spans
(6,40)-(6,72)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (8,45)-(8,53)) [Var (Just (8,46)-(8,48)) "l1",Var (Just (8,50)-(8,52)) "l2"]
*)

(* typed spans
(8,45)-(8,53)
*)

(* correct types
('a list * 'b list)
*)

(* bad types
unit
*)
