
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

*)

(* changed spans
(6,65)-(6,75)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (6,65)-(6,75)) [Bop (Just (6,66)-(6,74)) Mod (Var (Just (6,66)-(6,67)) "n") (Lit (Just (6,72)-(6,74)) (LI 10))] Nothing
*)

(* typed spans
(6,65)-(6,75)
*)

(* correct types
int list
*)

(* bad types
int
*)
