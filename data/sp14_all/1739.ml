
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(5,54)-(5,64)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,54)-(5,64)) [Bop (Just (5,55)-(5,63)) Mod (Var (Just (5,55)-(5,56)) "n") (Lit (Just (5,61)-(5,63)) (LI 10))] Nothing
*)

(* typed spans
(5,54)-(5,64)
*)

(* correct types
int list
*)

(* bad types
int
*)
