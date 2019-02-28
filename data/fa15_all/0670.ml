
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,69)
match xs with
| [] -> 0
| xf :: xb -> xf + sumList xb
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (2,21)-(2,74)) (Var (Just (2,27)-(2,29)) "xs") [(ConPat (Just (2,37)-(2,39)) "[]" Nothing,Nothing,Lit (Just (2,43)-(2,44)) (LI 0)),(ConsPat (Just (2,47)-(2,53)) (VarPat (Just (2,47)-(2,49)) "xf") (VarPat (Just (2,51)-(2,53)) "xb"),Nothing,Bop (Just (2,57)-(2,74)) Plus (Var (Just (2,57)-(2,59)) "xf") (App (Just (2,62)-(2,74)) (Var (Just (2,63)-(2,70)) "sumList") [Var (Just (2,71)-(2,73)) "xb"]))]
*)

(* typed spans
(2,21)-(2,74)
*)

(* correct types
int
*)

(* bad types
int list -> int
*)
