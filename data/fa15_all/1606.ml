
let rec digitsOfInt n =
  if n < 0 then [] else [(digitsOfInt n) / 10] @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
EMPTY
EmptyG

(3,25)-(3,40)
EMPTY
EmptyG

(3,25)-(3,45)
EMPTY
EmptyG

(3,26)-(3,37)
EMPTY
EmptyG

(3,38)-(3,39)
EMPTY
EmptyG

(3,43)-(3,45)
[]
ListG EmptyG

*)

(* typed spans
int list
*)
