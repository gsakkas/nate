
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,44)-(2,46)
fun fs -> fs
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
Lam (Just (3,36)-(3,43)) (VarPat (Just (3,36)-(3,38)) "fs") (Var (Just (3,41)-(3,43)) "fs") Nothing
*)

(* typed spans
(3,12)-(3,23)
(3,36)-(3,43)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
'a
*)
