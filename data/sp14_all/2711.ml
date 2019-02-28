
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,38)-(2,53)
n mod 10
BopG VarG LitG

(2,57)-(2,67)
n / 10
BopG VarG LitG

(2,24)-(2,67)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (3,16)-(3,26)) Mod (Var (Just (3,17)-(3,18)) "n") (Lit (Just (3,23)-(3,25)) (LI 10))
Bop (Just (3,43)-(3,51)) Div (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))
List (Just (3,58)-(3,60)) [] Nothing
*)

(* typed spans
(3,16)-(3,26)
(3,43)-(3,51)
(3,58)-(3,60)
*)

(* correct types
int
int
int list
*)

(* bad types
unit
int
unit
*)
