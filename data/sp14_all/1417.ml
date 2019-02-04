
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0 then [0] else if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(6,19)-(6,20)
EMPTY
EmptyG

(6,27)-(6,76)
EMPTY
EmptyG

(6,30)-(6,35)
EMPTY
EmptyG

(6,34)-(6,35)
EMPTY
EmptyG

*)
