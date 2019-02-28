
let rec sumList xs =
  match xs with | [] -> [] | h1::h2::t -> h1 + (h2 sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(3,2)-(3,61)
match xs with
| [] -> 0
| x :: xs' -> x + sumList xs'
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (2,21)-(2,74)) (Var (Just (2,27)-(2,29)) "xs") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0)),(ConsPat (Just (2,47)-(2,53)) (VarPat (Just (2,47)-(2,48)) "x") (VarPat (Just (2,50)-(2,53)) "xs'"),Nothing,Bop (Just (2,57)-(2,74)) Plus (Var (Just (2,57)-(2,58)) "x") (App (Just (2,61)-(2,74)) (Var (Just (2,62)-(2,69)) "sumList") [Var (Just (2,70)-(2,73)) "xs'"]))]
*)

(* typed spans
(2,21)-(2,74)
*)

(* correct types
int
*)

(* bad types
'a list
*)
