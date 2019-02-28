
let rec retHead l = match l with | [] -> [] | h::t -> h;;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | hd::tl ->
      [((hd * i) mod 10) + (((retHead tl) * i) / 10)] @ (mulByDigit i tl);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [(hd * i) mod 10] @ (mulByDigit i tl);;

*)

(* changed spans
(2,16)-(2,55)
EMPTY
EmptyG

(8,7)-(8,52)
EMPTY
EmptyG

(8,27)-(8,52)
EMPTY
EmptyG

*)

(* typed spans
*)

(* typed spans
*)

(* typed spans
*)
