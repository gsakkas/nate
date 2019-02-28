
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + t;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(2,21)-(2,60)
match xs with
| [] -> 0
CaseG VarG (fromList [(Nothing,LitG)])

*)

(* changed exprs
Case (Just (2,21)-(2,44)) (Var (Just (2,27)-(2,29)) "xs") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0))]
*)

(* typed spans
(2,21)-(2,44)
*)

(* correct types
int
*)

(* bad types
int
*)
