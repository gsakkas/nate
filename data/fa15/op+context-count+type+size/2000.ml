
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int y;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,39)-(3,67)
(3,56)-(3,65)
(3,56)-(3,67)
(3,66)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,2)-(3,67)
(3,23)-(3,27)
(3,39)-(3,67)
(3,56)-(3,65)
(3,56)-(3,67)
*)
