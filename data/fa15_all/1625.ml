
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,5)-(3,10)
n <= 0
BopG VarG LitG

(3,24)-(3,34)
EMPTY
EmptyG

*)

(* typed spans
(3,5)-(3,11)
*)

(* typed spans
bool
*)

(* typed spans
bool
*)
