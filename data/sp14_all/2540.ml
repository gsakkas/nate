
let rec digitsOfInt n =
  if n < 0
  then []
  else (let x = n / 10
        and y = n mod 10 in (digitsOfInt x) @ y);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (let x = n / 10
        and y = n mod 10 in (digitsOfInt x) @ [y]);;

*)

(* changed spans
(6,46)-(6,47)
[y]
ListG VarG

*)

(* changed exprs
List (Just (6,46)-(6,49)) [Var (Just (6,47)-(6,48)) "y"] Nothing
*)

(* typed spans
(6,46)-(6,49)
*)

(* correct types
int list
*)

(* bad types
int
*)
