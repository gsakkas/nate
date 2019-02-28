
let pipe fs = let f a x x a = x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
a
VarG

*)

(* changed exprs
Var (Just (2,30)-(2,31)) "a"
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
