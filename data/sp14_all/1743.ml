
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse l) h;;

*)

(* changed spans
(2,59)-(2,77)
myAppend (listReverse l) h
AppG [AppG [EmptyG],VarG]

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,60)-(2,71)
(2,60)-(2,73)
*)
