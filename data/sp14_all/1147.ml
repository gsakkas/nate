
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n / 10) > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,10)-(5,22)
n < 10
BopG VarG LitG

(5,28)-(5,63)
[n]
ListG VarG

*)

(* changed exprs
Bop (Just (5,10)-(5,16)) Lt (Var (Just (5,10)-(5,11)) "n") (Lit (Just (5,14)-(5,16)) (LI 10))
List (Just (5,22)-(5,25)) [Var (Just (5,23)-(5,24)) "n"] Nothing
*)

(* typed spans
(5,10)-(5,16)
(5,22)-(5,25)
*)

(* correct types
bool
int list
*)

(* bad types
bool
int list
*)
