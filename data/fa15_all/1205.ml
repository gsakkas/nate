
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then h;;

*)

(* changed spans
(2,66)-(2,69)
h
VarG

*)

(* changed exprs
Var (Just (2,66)-(2,67)) "h"
*)

(* typed spans
(2,66)-(2,67)
*)

(* correct types
unit
*)

(* bad types
unit
*)
