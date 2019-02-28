
let pipe fs = let f a x b = b x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
b
VarG

*)

(* changed exprs
Var (Just (2,28)-(2,29)) "b"
*)

(* typed spans
(2,28)-(2,29)
*)

(* correct types
'a
*)

(* bad types
'a
*)
