
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,37)-(4,59)
n mod 10
BopG VarG LitG

(4,63)-(4,73)
EMPTY
EmptyG

(4,64)-(4,65)
EMPTY
EmptyG

(4,70)-(4,72)
EMPTY
EmptyG

*)
