
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
(2,17)-(2,56)
(2,21)-(2,56)
(2,27)-(2,28)
(2,42)-(2,44)
(2,55)-(2,56)
(8,10)-(8,52)
(8,31)-(8,52)
*)

(* type error slice
(2,4)-(2,58)
(2,17)-(2,56)
(2,21)-(2,56)
(2,21)-(2,56)
(2,21)-(2,56)
(2,21)-(2,56)
(2,27)-(2,28)
(2,42)-(2,44)
(2,55)-(2,56)
(5,3)-(8,73)
(5,3)-(8,73)
(8,10)-(8,12)
(8,10)-(8,16)
(8,31)-(8,38)
(8,31)-(8,41)
(8,39)-(8,41)
*)
