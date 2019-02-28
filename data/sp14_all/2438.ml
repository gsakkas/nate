
let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (l2 :: 0))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(4,19)-(4,20)
l2
VarG

*)

(* changed exprs
Var (Just (4,18)-(4,20)) "l2"
*)

(* typed spans
(4,18)-(4,20)
*)

(* correct types
int list
*)

(* bad types
int
*)
