
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,46)-(2,53)
t = []
BopG VarG (ListG EmptyG)

(2,59)-(2,68)
0
LitG

*)

(* changed exprs
Bop (Just (2,46)-(2,52)) Eq (Var (Just (2,46)-(2,47)) "t") (List (Just (2,50)-(2,52)) [] Nothing)
Lit (Just (2,58)-(2,59)) (LI 0)
*)

(* typed spans
(2,46)-(2,52)
(2,58)-(2,59)
*)

(* correct types
bool
int
*)

(* bad types
bool
unit
*)
