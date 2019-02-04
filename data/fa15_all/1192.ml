
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,56)-(2,60)
EMPTY
EmptyG

(2,66)-(2,67)
false
LitG

(2,66)-(2,69)
EMPTY
EmptyG

*)
