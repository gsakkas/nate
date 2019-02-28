
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,41)-(3,51)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,41)-(3,51)) [Bop (Just (3,42)-(3,50)) Mod (Var (Just (3,42)-(3,43)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))] Nothing
*)

(* typed spans
(3,41)-(3,51)
*)

(* correct types
int list
*)

(* bad types
int
*)
