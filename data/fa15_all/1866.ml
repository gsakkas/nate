
let rec digitsOfInt n = if n >= 0 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,27)-(2,33)
n <= 0
BopG VarG LitG

(2,39)-(2,75)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (3,5)-(3,11)) Le (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,10)-(3,11)) (LI 0))
List (Just (3,17)-(3,19)) [] Nothing
*)

(* typed spans
(3,5)-(3,11)
(3,17)-(3,19)
*)

(* correct types
bool
int list
*)

(* bad types
bool
int list
*)
