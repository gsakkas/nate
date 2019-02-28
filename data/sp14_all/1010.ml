
let pipe fs =
  let f a x d x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "a") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "a"]) Nothing
*)

(* typed spans
(2,24)-(2,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a -> 'b
*)
