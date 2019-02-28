
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ [l1]), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ [l2]));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(6,59)-(6,63)
l1
VarG

(7,63)-(7,67)
l2
VarG

*)

(* changed exprs
Var (Just (6,59)-(6,61)) "l1"
Var (Just (7,63)-(7,65)) "l2"
*)

(* typed spans
(6,59)-(6,61)
(7,63)-(7,65)
*)

(* correct types
int list
int list
*)

(* bad types
'a list list
'a list list
*)
