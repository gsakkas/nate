
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
EMPTY
EmptyG

(5,13)-(5,23)
mulByDigit i (List.rev l)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(5,40)-(5,45)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
