
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,37)-(5,61)
append [h] [h]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(2,59)-(2,77)
(2,64)-(2,77)
(2,65)-(2,71)
(5,37)-(5,43)
(5,37)-(5,61)
*)
