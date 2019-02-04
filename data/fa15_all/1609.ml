
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,29)-(3,62)
EMPTY
EmptyG

(3,30)-(3,56)
EMPTY
EmptyG

(3,42)-(3,53)
EMPTY
EmptyG

(3,54)-(3,55)
EMPTY
EmptyG

(3,59)-(3,61)
EMPTY
EmptyG

*)
