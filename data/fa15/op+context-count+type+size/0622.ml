
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n mod 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(3,18)-(3,29)
(3,18)-(3,39)
(3,37)-(3,39)
*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,17)-(3,51)
(3,17)-(3,51)
(3,18)-(3,29)
(3,18)-(3,39)
*)
