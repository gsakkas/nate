
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,46)-(3,47)
(3,46)-(3,67)
*)

(* type error slice
(3,3)-(3,67)
(3,3)-(3,67)
(3,3)-(3,67)
(3,3)-(3,67)
(3,3)-(3,67)
(3,34)-(3,35)
(3,46)-(3,47)
(3,46)-(3,67)
(3,46)-(3,67)
*)