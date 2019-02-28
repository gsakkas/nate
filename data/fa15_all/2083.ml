
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | h::_ -> h | h::t -> h + (sumList t);;

*)

(* changed spans
(3,2)-(3,60)
match xs with
| [] -> 0
| h :: _ -> h
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (3,2)-(3,63)) (Var (Just (3,8)-(3,10)) "xs") [(ConPat (Just (3,18)-(3,20)) "[]" Nothing,Nothing,Lit (Just (3,24)-(3,25)) (LI 0)),(ConsPat (Just (3,28)-(3,32)) (VarPat (Just (3,28)-(3,29)) "h") (WildPat (Just (3,31)-(3,32))),Nothing,Var (Just (3,36)-(3,37)) "h"),(ConsPat (Just (3,40)-(3,44)) (VarPat (Just (3,40)-(3,41)) "h") (VarPat (Just (3,43)-(3,44)) "t"),Nothing,Bop (Just (3,48)-(3,63)) Plus (Var (Just (3,48)-(3,49)) "h") (App (Just (3,52)-(3,63)) (Var (Just (3,53)-(3,60)) "sumList") [Var (Just (3,61)-(3,62)) "t"]))]
*)

(* typed spans
(3,2)-(3,63)
*)

(* correct types
int
*)

(* bad types
int
*)
