
let pipe fs =
  let f a x c d = a x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "a") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "x") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
*)

(* typed spans
(3,12)-(3,23)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b -> 'c
*)
