
let rec sumList xs = match xs with | [] -> 0 | h::t -> h +. (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,55)-(2,71)
*)

(* type error slice
(2,3)-(2,73)
(2,16)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,43)-(2,44)
(2,55)-(2,71)
(2,55)-(2,71)
(2,60)-(2,71)
(2,61)-(2,68)
*)
