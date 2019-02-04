
let rec digitsOfInt n =
  if n <= 0 then [] else [((digitsOfInt (n / 10)), (n mod 10))];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,26)-(3,62)
EMPTY
EmptyG

(3,27)-(3,49)
EMPTY
EmptyG

(3,28)-(3,39)
EMPTY
EmptyG

(3,40)-(3,48)
EMPTY
EmptyG

(3,41)-(3,42)
EMPTY
EmptyG

(3,45)-(3,47)
EMPTY
EmptyG

*)
