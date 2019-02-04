
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,25)-(3,61)
EMPTY
EmptyG

(3,39)-(3,61)
EMPTY
EmptyG

(3,40)-(3,55)
EMPTY
EmptyG

(3,41)-(3,52)
EMPTY
EmptyG

(3,53)-(3,54)
EMPTY
EmptyG

(3,58)-(3,60)
EMPTY
EmptyG

*)
