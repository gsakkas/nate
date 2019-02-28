
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,38)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,16)-(3,26)) Mod (Var (Just (3,17)-(3,18)) "n") (Lit (Just (3,23)-(3,25)) (LI 10))
*)

(* typed spans
(3,16)-(3,26)
*)

(* correct types
int
*)

(* bad types
'a
*)
