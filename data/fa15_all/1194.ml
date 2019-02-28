
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h else b;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,66)-(2,69)
false
LitG

(2,75)-(2,76)
()
ConAppG Nothing

*)

(* changed exprs
Lit (Just (2,56)-(2,61)) (LB False)
ConApp (Just (2,49)-(2,68)) "()" Nothing (Just (TApp "unit" []))
*)

(* typed spans
(2,56)-(2,61)
(2,49)-(2,68)
*)

(* correct types
bool
unit
*)

(* bad types
'a
'a
*)
