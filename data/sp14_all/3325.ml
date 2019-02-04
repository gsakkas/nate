
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev t)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
EMPTY
EmptyG

(5,43)-(5,45)
EMPTY
EmptyG

*)
