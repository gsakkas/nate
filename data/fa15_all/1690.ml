
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,44)-(2,46)
0
LitG

*)

(* type error slice
(2,4)-(2,74)
(2,17)-(2,72)
(2,22)-(2,72)
(2,44)-(2,46)
(2,57)-(2,72)
(2,61)-(2,72)
(2,62)-(2,69)
*)
