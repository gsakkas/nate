
let rec wwhile (f,b) =
  match b with | b -> if (f b) = ((f b), true) then wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  match b with | b -> if (f b) = (b, true) then wwhile (f, b);;

*)

(* changed spans
(3,34)-(3,39)
EMPTY
EmptyG

(3,35)-(3,36)
EMPTY
EmptyG

*)
