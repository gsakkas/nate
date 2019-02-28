
let pipe fs = let f a x = a x in let base g p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
a
VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "a"
*)

(* typed spans
(2,26)-(2,27)
*)

(* correct types
'a -> 'b -> 'b
*)

(* bad types
'a
*)
