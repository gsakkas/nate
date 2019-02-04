
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
EMPTY
EmptyG

(3,44)-(3,46)
EMPTY
EmptyG

*)
