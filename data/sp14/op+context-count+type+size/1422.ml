
let rec digitsOfInt n =
  if n <= 0 then [] else [((digitsOfInt (n / 10)), (n mod 10))];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,26)-(3,62)
(3,27)-(3,49)
(3,28)-(3,39)
(3,40)-(3,48)
*)

(* type error slice
(2,3)-(3,65)
(2,20)-(3,63)
(3,2)-(3,63)
(3,25)-(3,63)
(3,25)-(3,63)
(3,26)-(3,62)
(3,27)-(3,49)
(3,28)-(3,39)
*)
