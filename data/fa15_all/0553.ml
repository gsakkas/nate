
let pipe fs =
  let f a x x = x a in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,32)-(3,39)
fun a -> a
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "a") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "a"]) Nothing
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "a") (Var (Just (2,48)-(2,49)) "a") Nothing
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
('a -> 'b) -> 'b
'a -> 'a
*)
