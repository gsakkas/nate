
let rec digitsOfInt n =
  if n < 0 then print_int 0 else (print_int n) / 10; digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,35)-(3,52)
(3,45)-(3,46)
*)

(* type error slice
(3,3)-(3,52)
(3,3)-(3,52)
(3,17)-(3,26)
(3,17)-(3,28)
(3,35)-(3,44)
(3,35)-(3,46)
(3,35)-(3,52)
(3,35)-(3,52)
*)
