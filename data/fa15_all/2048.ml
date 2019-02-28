
let identity a = a;;

let pipe fs =
  let f a x x = x a in let base = identity in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(5,12)-(5,19)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(5,34)-(5,42)
fun m -> m
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "m") (Var (Just (3,40)-(3,41)) "m") Nothing
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
('a -> 'b) -> 'b
'a -> 'a
*)
