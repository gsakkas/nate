
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,37)
n / 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (2,39)-(2,45)) Div (Var (Just (2,39)-(2,40)) "n") (Lit (Just (2,43)-(2,45)) (LI 10))
*)

(* typed spans
(2,39)-(2,45)
*)

(* correct types
int
*)

(* bad types
int
*)
