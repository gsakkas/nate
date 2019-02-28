
let rec sumList xs =
  match xs with | [] -> 0 | x::[] -> x | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(3,2)-(3,70)
match xs with
| [] -> 0
| x :: y -> x + sumList y
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (2,21)-(2,70)) (Var (Just (2,27)-(2,29)) "xs") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0)),(ConsPat (Just (2,47)-(2,51)) (VarPat (Just (2,47)-(2,48)) "x") (VarPat (Just (2,50)-(2,51)) "y"),Nothing,Bop (Just (2,55)-(2,70)) Plus (Var (Just (2,55)-(2,56)) "x") (App (Just (2,59)-(2,70)) (Var (Just (2,60)-(2,67)) "sumList") [Var (Just (2,68)-(2,69)) "y"]))]
*)

(* typed spans
(2,21)-(2,70)
*)

(* correct types
int
*)

(* bad types
int
*)
