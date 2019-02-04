
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,50)-(3,72)
EMPTY
EmptyG

(3,64)-(3,65)
n / 10
BopG VarG LitG

*)
