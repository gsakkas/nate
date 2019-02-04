
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else (n mod 10) :: ((myList n) mod 100) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,39)-(4,59)
EMPTY
EmptyG

(4,39)-(4,69)
EMPTY
EmptyG

(4,40)-(4,50)
EMPTY
EmptyG

(4,48)-(4,49)
EMPTY
EmptyG

(4,55)-(4,58)
EMPTY
EmptyG

(4,63)-(4,69)
EMPTY
EmptyG

*)
