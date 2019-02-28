
let pipe fs = let f a x b = b a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = a b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
b
VarG

*)

(* changed exprs
Var (Just (2,30)-(2,31)) "b"
*)

(* typed spans
(2,30)-(2,31)
*)

(* correct types
'a
*)

(* bad types
'a
*)
