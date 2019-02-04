
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,32)-(3,54)
n mod 10
BopG VarG LitG

(3,58)-(3,68)
EMPTY
EmptyG

(3,59)-(3,60)
EMPTY
EmptyG

(3,65)-(3,67)
EMPTY
EmptyG

*)
