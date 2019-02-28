
let rec sumList xs = let x::t = xs in if t != [] then x + (sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,38)-(2,69)
x + (if t = []
     then 0
     else sumList t)
BopG VarG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (2,38)-(2,75)) Plus (Var (Just (2,38)-(2,39)) "x") (Ite (Just (2,42)-(2,75)) (Bop (Just (2,46)-(2,52)) Eq (Var (Just (2,46)-(2,47)) "t") (List (Just (2,50)-(2,52)) [] Nothing)) (Lit (Just (2,58)-(2,59)) (LI 0)) (App (Just (2,65)-(2,74)) (Var (Just (2,65)-(2,72)) "sumList") [Var (Just (2,73)-(2,74)) "t"]))
*)

(* typed spans
(2,38)-(2,75)
*)

(* correct types
int
*)

(* bad types
unit
*)
