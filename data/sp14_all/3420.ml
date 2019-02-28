
let pipe fs = let f a x = a x in let base a = a in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x w = x (a w) in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun w -> x (a w)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "w") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "w"]]) Nothing
*)

(* typed spans
(3,12)-(3,23)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
