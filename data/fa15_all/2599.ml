
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,75)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (2,21)-(2,70)) (Var (Just (2,27)-(2,29)) "xs") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0)),(ConsPat (Just (2,47)-(2,51)) (VarPat (Just (2,47)-(2,48)) "h") (VarPat (Just (2,50)-(2,51)) "t"),Nothing,Bop (Just (2,55)-(2,70)) Plus (Var (Just (2,55)-(2,56)) "h") (App (Just (2,59)-(2,70)) (Var (Just (2,60)-(2,67)) "sumList") [Var (Just (2,68)-(2,69)) "t"]))]
*)

(* typed spans
(2,21)-(2,70)
*)

(* correct types
int
*)

(* bad types
'a list
*)
