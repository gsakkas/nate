
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,48)-(2,68)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (2,48)-(2,56)) Mod (Var (Just (2,48)-(2,49)) "n") (Lit (Just (2,54)-(2,56)) (LI 10))
*)

(* typed spans
(2,48)-(2,56)
*)

(* correct types
int
*)

(* bad types
'a
*)
