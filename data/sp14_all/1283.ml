
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,52)-(3,63)
EMPTY
EmptyG

(3,52)-(3,74)
EMPTY
EmptyG

*)
