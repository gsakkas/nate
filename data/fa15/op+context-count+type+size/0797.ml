
let rec listReverse l = match l with | [] -> [] | h::t -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(2,59)-(2,77)
*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,59)-(2,77)
(2,63)-(2,74)
(2,63)-(2,76)
*)
