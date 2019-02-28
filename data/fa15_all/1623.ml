
let rec digitsOfInt n =
  if n < 0 then [] else [(digitsOfInt (n / 10)) @ (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,61)
EMPTY
EmptyG

(3,50)-(3,60)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* typed spans
(3,49)-(3,59)
*)

(* typed spans
int list
*)

(* typed spans
int
*)
