
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
*)

(* type error slice
(2,3)-(2,74)
(2,16)-(2,72)
(2,21)-(2,72)
(2,21)-(2,72)
(2,43)-(2,45)
(2,56)-(2,72)
(2,56)-(2,72)
(2,60)-(2,72)
(2,61)-(2,68)
*)
