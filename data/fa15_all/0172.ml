
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n mod 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,39)
n mod 100
BopG VarG LitG

*)

(* changed exprs
Bop (Just (2,39)-(2,48)) Mod (Var (Just (2,39)-(2,40)) "n") (Lit (Just (2,45)-(2,48)) (LI 100))
*)

(* typed spans
(2,39)-(2,48)
*)

(* correct types
int
*)

(* bad types
int
*)
