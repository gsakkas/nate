
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,2)-(3,60)
(3,58)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,2)-(3,60)
(3,8)-(3,9)
(3,45)-(3,60)
(3,46)-(3,57)
(3,58)-(3,59)
*)
