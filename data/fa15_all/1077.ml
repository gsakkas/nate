
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "x") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "a") [Var (Just (2,30)-(2,31)) "x"]) Nothing
*)

(* typed spans
(2,24)-(2,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
*)
