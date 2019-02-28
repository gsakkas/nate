
let pipe fs = let f a x = x + a in let base = "" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = (+) 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
x
VarG

(2,46)-(2,48)
(+) 0
AppG (fromList [LitG])

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
App (Just (2,42)-(2,47)) (Var (Just (2,42)-(2,45)) "+") [Lit (Just (2,46)-(2,47)) (LI 0)]
*)

(* typed spans
(2,26)-(2,27)
(2,42)-(2,47)
*)

(* correct types
int -> int
int -> int
*)

(* bad types
int
string
*)
