
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,74)-(2,77)
()
ConAppG Nothing

*)

(* changed exprs
ConApp (Just (2,49)-(2,68)) "()" Nothing (Just (TApp "unit" []))
*)

(* typed spans
(2,49)-(2,68)
*)

(* correct types
unit
*)

(* bad types
'a
*)
