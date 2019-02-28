
let pipe fs = let f a x = a ^ x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,31)
fun b -> x b
LamG (AppG (fromList [EmptyG]))

(2,46)-(2,48)
fun b -> b
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "b") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "b"]) Nothing
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "b") (Var (Just (2,48)-(2,49)) "b") Nothing
*)

(* typed spans
(2,24)-(2,31)
(2,44)-(2,49)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
string
'a list
*)
