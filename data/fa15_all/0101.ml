
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else return :: 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else 1 :: return;;

*)

(* changed spans
(3,47)-(3,53)
EMPTY
EmptyG

*)
