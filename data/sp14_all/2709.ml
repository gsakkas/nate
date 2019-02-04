
let rec digitsOfInt n =
  if n > 0 then [[(digitsOfInt n) / 10]; n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,39)
EMPTY
EmptyG

(3,18)-(3,33)
EMPTY
EmptyG

(3,18)-(3,38)
EMPTY
EmptyG

(3,19)-(3,30)
EMPTY
EmptyG

(3,36)-(3,38)
EMPTY
EmptyG

*)
