
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,49)-(3,59)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,49)-(3,59)) [Bop (Just (3,50)-(3,58)) Mod (Var (Just (3,50)-(3,51)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))] Nothing
*)

(* typed spans
(3,49)-(3,59)
*)

(* correct types
int list
*)

(* bad types
int
*)
