
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [n mod 10] @ (digitsOfInt n10));;

*)

(* changed spans
(3,46)-(3,73)
EMPTY
EmptyG

(3,47)-(3,58)
EMPTY
EmptyG

(3,47)-(3,62)
EMPTY
EmptyG

(3,59)-(3,62)
[n mod 10] @ digitsOfInt n10
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,64)-(3,72)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
