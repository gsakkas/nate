
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,67)-(2,68)
EMPTY
EmptyG

(2,67)-(2,70)
EMPTY
EmptyG

*)
