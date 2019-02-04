
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with | true  -> [] | false  -> (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(5,28)-(5,50)
EMPTY
EmptyG

(5,47)-(5,49)
EMPTY
EmptyG

*)
