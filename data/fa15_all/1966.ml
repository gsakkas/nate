
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t);;

*)

(* changed spans
(3,46)-(3,68)
EMPTY
EmptyG

(3,47)-(3,48)
EMPTY
EmptyG

*)
