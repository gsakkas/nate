
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
a x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "a") [Var (Just (2,30)-(2,31)) "x"]
*)

(* typed spans
(2,28)-(2,31)
*)

(* correct types
'a
*)

(* bad types
'a
*)
