
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,32)-(3,42)
fun z -> z
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "z") (Var (Just (3,40)-(3,41)) "z") Nothing
*)

(* typed spans
(3,12)-(3,23)
(3,36)-(3,41)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
'a
*)
