
let pipe fs = let f a x = a x in let base = (+) 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
x
VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
*)

(* typed spans
(2,26)-(2,27)
*)

(* correct types
int -> int
*)

(* bad types
'a
*)
