
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,47)-(2,62)
EMPTY
EmptyG

(2,47)-(2,67)
EMPTY
EmptyG

(2,48)-(2,59)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,60)-(2,61)
n mod 10
BopG VarG LitG

*)
