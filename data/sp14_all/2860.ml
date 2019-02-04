
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else if (List.length ((digitsOfInt (n / 10)) @ [n mod 10])) = 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(7,9)-(7,12)
EMPTY
EmptyG

(7,10)-(7,11)
EMPTY
EmptyG

(8,9)-(8,75)
EMPTY
EmptyG

(8,12)-(8,63)
EMPTY
EmptyG

(8,12)-(8,67)
EMPTY
EmptyG

(8,13)-(8,24)
[]
ListG EmptyG Nothing

(8,66)-(8,67)
EMPTY
EmptyG

(8,73)-(8,75)
EMPTY
EmptyG

*)
