
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = l1 * l2 in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,17)-(5,24)
(l1 , l2)
TupleG (fromList [VarG])

(5,28)-(5,60)
retTuple
VarG

*)

(* changed exprs
Tuple (Just (5,17)-(5,25)) [Var (Just (5,18)-(5,20)) "l1",Var (Just (5,22)-(5,24)) "l2"]
Var (Just (5,29)-(5,37)) "retTuple"
*)

(* typed spans
(5,17)-(5,25)
(5,29)-(5,37)
*)

(* correct types
('a list * 'b list)
('a list * 'b list)
*)

(* bad types
int
unit
*)
