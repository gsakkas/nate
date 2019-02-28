
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,50)-(3,60)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,50)-(3,60)) [Bop (Just (3,51)-(3,59)) Mod (Var (Just (3,51)-(3,52)) "n") (Lit (Just (3,57)-(3,59)) (LI 10))] Nothing
*)

(* typed spans
(3,50)-(3,60)
*)

(* correct types
int list
*)

(* bad types
int
*)
