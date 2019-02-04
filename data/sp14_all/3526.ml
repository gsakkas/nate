
let rec digitsOfInt n = if n < 0 then [] else [(digitsOfInt (n / 10)) mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,77)
EMPTY
EmptyG

(2,47)-(2,76)
EMPTY
EmptyG

(2,74)-(2,76)
EMPTY
EmptyG

*)
