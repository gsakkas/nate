
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - List.length)) @ l1), l2);;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(8,38)-(8,49)
List.length l1
AppG (fromList [VarG])

(8,59)-(8,61)
l1
VarG

*)

(* changed exprs
App (Just (8,38)-(8,54)) (Var (Just (8,39)-(8,50)) "List.length") [Var (Just (8,51)-(8,53)) "l1"]
Var (Just (8,59)-(8,61)) "l1"
*)

(* typed spans
(8,38)-(8,54)
(8,59)-(8,61)
*)

(* correct types
int
int list
*)

(* bad types
'a list -> int
int list
*)
