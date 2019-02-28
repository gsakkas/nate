
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,22)-(5,23)
[n]
ListG VarG

*)

(* changed exprs
List (Just (5,22)-(5,25)) [Var (Just (5,23)-(5,24)) "n"] Nothing
*)

(* typed spans
(5,22)-(5,25)
*)

(* correct types
int list
*)

(* bad types
int
*)
