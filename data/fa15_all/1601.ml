
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) mod 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,49)
EMPTY
EmptyG

(3,46)-(3,48)
EMPTY
EmptyG

*)
