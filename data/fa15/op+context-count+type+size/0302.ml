
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else List.rev ((n mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,25)-(3,61)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,51)-(3,61)
(3,52)-(3,53)
*)

(* type error slice
(2,3)-(3,63)
(2,20)-(3,61)
(3,2)-(3,61)
(3,25)-(3,47)
(3,25)-(3,61)
(3,25)-(3,61)
(3,25)-(3,61)
(3,26)-(3,37)
(3,51)-(3,61)
*)
