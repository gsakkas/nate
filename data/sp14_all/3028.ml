
let pipe fs = let f a x x = a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = x y in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun y -> x y
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "y") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "y"]) Nothing
*)

(* typed spans
(2,24)-(2,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b
*)
