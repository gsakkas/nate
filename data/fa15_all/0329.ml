
let pipe fs = let f a x = a x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p_pre = x (a p_pre) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun p_pre -> x (a p_pre)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,31)) (VarPat (Just (3,12)-(3,17)) "p_pre") (App (Just (3,20)-(3,31)) (Var (Just (3,20)-(3,21)) "x") [App (Just (3,22)-(3,31)) (Var (Just (3,23)-(3,24)) "a") [Var (Just (3,25)-(3,30)) "p_pre"]]) Nothing
*)

(* typed spans
(3,12)-(3,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
