
let rec sumList xs = match xs with | [] -> [] | x::xs' -> 1 sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,58)-(2,71)
0
LitG

(2,60)-(2,67)
x + sumList xs'
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lit (Just (2,43)-(2,44)) (LI 0)
Bop (Just (2,57)-(2,74)) Plus (Var (Just (2,57)-(2,58)) "x") (App (Just (2,61)-(2,74)) (Var (Just (2,62)-(2,69)) "sumList") [Var (Just (2,70)-(2,73)) "xs'"])
*)

(* typed spans
(2,43)-(2,44)
(2,57)-(2,74)
*)

(* correct types
int
int
*)

(* bad types
'a list
'a list -> 'b list
*)
