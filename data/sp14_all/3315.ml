
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;

*)

(* changed spans
(5,12)-(5,47)
EMPTY
EmptyG

(5,13)-(5,46)
EMPTY
EmptyG

(5,14)-(5,24)
mulByDigit i t
AppG (fromList [VarG])

(5,30)-(5,46)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

(5,43)-(5,45)
EMPTY
EmptyG

*)
