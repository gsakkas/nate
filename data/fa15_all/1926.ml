
let rec digitsOfInt n =
  if n < 0 then print_int 0 else (print_int n) / 10; digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,33)-(3,51)
EMPTY
EmptyG

(3,44)-(3,45)
n / 10
BopG VarG LitG

*)
