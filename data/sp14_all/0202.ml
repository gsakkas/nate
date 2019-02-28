
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
0
LitG

(2,62)-(2,77)
sumList xs'
AppG (fromList [VarG])

*)

(* changed exprs
Lit (Just (2,43)-(2,44)) (LI 0)
App (Just (2,61)-(2,74)) (Var (Just (2,62)-(2,69)) "sumList") [Var (Just (2,70)-(2,73)) "xs'"]
*)

(* typed spans
(2,43)-(2,44)
(2,61)-(2,74)
*)

(* correct types
int
int
*)

(* bad types
'a list
int
*)
