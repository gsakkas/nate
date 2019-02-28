
let rec digitsOfInt n =
  if n > 0 then [[(digitsOfInt n) / 10]; n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,39)
n
VarG

*)

(* changed exprs
Var (Just (2,39)-(2,40)) "n"
*)

(* typed spans
(2,39)-(2,40)
*)

(* correct types
int
*)

(* bad types
int list
*)
