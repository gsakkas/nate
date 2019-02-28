
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,64)-(5,74)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,64)-(5,74)) [Bop (Just (5,65)-(5,73)) Mod (Var (Just (5,65)-(5,66)) "n") (Lit (Just (5,71)-(5,73)) (LI 10))] Nothing
*)

(* typed spans
(5,64)-(5,74)
*)

(* correct types
int list
*)

(* bad types
int
*)
