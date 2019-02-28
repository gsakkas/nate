
let pipe fs = let f a x = x a in let base = 0 (+) in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
x
VarG

(2,44)-(2,45)
0
LitG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Lit (Just (2,46)-(2,47)) (LI 0)
*)

(* typed spans
(2,26)-(2,27)
(2,46)-(2,47)
*)

(* correct types
int -> int
int
*)

(* bad types
'a
int
*)
