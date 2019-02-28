
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h else h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,66)-(2,69)
false
LitG

*)

(* changed exprs
Lit (Just (2,56)-(2,61)) (LB False)
*)

(* typed spans
(2,56)-(2,61)
*)

(* correct types
bool
*)

(* bad types
'a
*)
