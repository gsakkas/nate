
let rec listReverse l = match l with | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l = match l with | h::t -> [h] @ (listReverse t);;

*)

(* changed spans
(2,66)-(2,69)
*)

(* type error slice
(2,3)-(2,72)
(2,20)-(2,70)
(2,24)-(2,70)
(2,24)-(2,70)
(2,30)-(2,31)
(2,53)-(2,70)
(2,54)-(2,65)
(2,66)-(2,69)
(2,66)-(2,69)
(2,67)-(2,68)
*)
