
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n & 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,50)-(3,56)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,50)-(3,58)) Mod (Var (Just (3,50)-(3,51)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))
*)

(* typed spans
(3,50)-(3,58)
*)

(* correct types
int
*)

(* bad types
'a
*)
