
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (digitsOfInt (-1) (n mod 10)) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else (n mod 10) :: return;;

*)

(* changed spans
(4,28)-(4,57)
EMPTY
EmptyG

(4,29)-(4,40)
EMPTY
EmptyG

(4,41)-(4,45)
EMPTY
EmptyG

*)
