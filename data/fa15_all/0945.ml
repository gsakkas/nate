
let pipe fs = let f a x = a x in let base g p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

(2,42)-(2,49)
fun z -> z
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "q") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "q"]) Nothing
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "z") (Var (Just (2,48)-(2,49)) "z") Nothing
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
'a
'a -> 'b -> 'b
*)
