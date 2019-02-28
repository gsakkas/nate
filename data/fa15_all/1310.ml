
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,29)-(5,61)
retTuple
VarG

*)

(* changed exprs
Var (Just (5,29)-(5,37)) "retTuple"
*)

(* typed spans
(5,29)-(5,37)
*)

(* correct types
('a list * 'b list)
*)

(* bad types
unit
*)
