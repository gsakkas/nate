
let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper [n > 10];;


(* fix

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else [n mod 10] @ (digitsOfIntHelper (n - ((n mod 10) / 10)));;

let rec digitsOfInt n = digitsOfIntHelper n;;

*)

(* changed spans
(7,42)-(7,50)
n
VarG

*)

(* changed exprs
Var (Just (7,42)-(7,43)) "n"
*)

(* typed spans
(7,42)-(7,43)
*)

(* correct types
int
*)

(* bad types
bool list
*)
