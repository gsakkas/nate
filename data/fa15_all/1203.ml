
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,67)-(2,70)
h
VarG

*)

(* changed exprs
Var (Just (2,67)-(2,68)) "h"
*)

(* typed spans
(2,67)-(2,68)
*)

(* correct types
unit
*)

(* bad types
unit
*)
