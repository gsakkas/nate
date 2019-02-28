
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' ->
      if (x * i) < 9
      then [(x * i) / 10] @ (mulByDigit i x')
      else [(x * i) / 10] @ ([(x * i) mod 10] + (mulByDigit i x'));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [(x * i) / 10; (x * i) mod 10] @ (mulByDigit i x');;

*)

(* changed spans
(6,6)-(8,66)
EMPTY
EmptyG

(7,11)-(7,25)
[(x * i) / 10 ; (x * i) mod 10]
ListG (BopG EmptyG EmptyG)

(8,28)-(8,66)
EMPTY
EmptyG

*)

(* typed spans
(5,13)-(5,43)
*)

(* typed spans
int list
*)

(* typed spans
int list
*)
