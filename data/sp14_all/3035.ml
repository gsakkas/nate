
let pipe fs = let f a x z = z a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x z = a z in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
z
VarG

*)

(* changed exprs
Var (Just (2,30)-(2,31)) "z"
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
