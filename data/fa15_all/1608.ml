
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
EMPTY
EmptyG

(3,25)-(3,36)
EMPTY
EmptyG

(3,25)-(3,45)
EMPTY
EmptyG

(3,37)-(3,45)
EMPTY
EmptyG

(3,38)-(3,39)
EMPTY
EmptyG

(3,42)-(3,44)
[]
ListG EmptyG Nothing

*)
