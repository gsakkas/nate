
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,38)
n mod 10
BopG VarG LitG

(3,58)-(3,59)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (3,16)-(3,26)) Mod (Var (Just (3,17)-(3,18)) "n") (Lit (Just (3,23)-(3,25)) (LI 10))
List (Just (3,58)-(3,60)) [] Nothing
*)

(* typed spans
(3,16)-(3,26)
(3,58)-(3,60)
*)

(* correct types
int
int list
*)

(* bad types
int
int
*)
