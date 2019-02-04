
let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then (n mod 10) :: (return digitsOfInt 0) else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(4,31)-(4,53)
EMPTY
EmptyG

(4,39)-(4,50)
EMPTY
EmptyG

(4,51)-(4,52)
EMPTY
EmptyG

*)
