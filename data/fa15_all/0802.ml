
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then n else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(6,19)-(6,20)
[n]
ListG VarG

*)

(* changed exprs
List (Just (6,19)-(6,22)) [Var (Just (6,20)-(6,21)) "n"] Nothing
*)

(* typed spans
(6,19)-(6,22)
*)

(* correct types
int list
*)

(* bad types
int
*)
