
let rec digitsOfInt n =
  if n < 0
  then []
  else (fun n  -> let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(5,7)-(5,66)
EMPTY
EmptyG

*)
