
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,24)-(3,75)
EMPTY
EmptyG

(3,31)-(3,32)
EMPTY
EmptyG

(3,31)-(3,39)
EMPTY
EmptyG

(3,37)-(3,39)
EMPTY
EmptyG

(3,52)-(3,74)
EMPTY
EmptyG

*)
