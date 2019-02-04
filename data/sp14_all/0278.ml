
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else ((listReverse n) mod 10) :: (listReverse (digitsOfInt (n / 10)));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,8)-(8,23)
EMPTY
EmptyG

(8,9)-(8,20)
EMPTY
EmptyG

*)
