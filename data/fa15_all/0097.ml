
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then returnList else returnList :: (1 digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n = [];;

*)

(* changed spans
(3,2)-(4,70)
EMPTY
EmptyG

(4,2)-(4,70)
EMPTY
EmptyG

*)

(* typed spans
*)

(* typed spans
*)

(* typed spans
*)
