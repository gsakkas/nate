
let rec digitsOfInt n =
  let return = [] in if n = 0 then return else print_int n; digitsOfInt 0;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n = 0 then return else digitsOfInt 0;;

*)

(* changed spans
(3,21)-(3,73)
EMPTY
EmptyG

(3,47)-(3,56)
EMPTY
EmptyG

(3,57)-(3,58)
EMPTY
EmptyG

(3,60)-(3,73)
EMPTY
EmptyG

*)
