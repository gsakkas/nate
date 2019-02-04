
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then h;;

*)

(* changed spans
(2,66)-(2,67)
EMPTY
EmptyG

(2,66)-(2,69)
EMPTY
EmptyG

*)
