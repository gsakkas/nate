
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n mod 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,28)
EMPTY
EmptyG

(3,17)-(3,39)
EMPTY
EmptyG

(3,36)-(3,38)
100
LitG

*)
