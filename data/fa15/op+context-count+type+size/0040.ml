
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
(3,45)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,2)-(3,67)
(3,2)-(3,67)
(3,2)-(3,67)
(3,2)-(3,67)
(3,33)-(3,34)
(3,45)-(3,46)
(3,45)-(3,67)
(3,45)-(3,67)
*)
