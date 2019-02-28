
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

(3,32)-(3,39)
x
VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "y") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "a") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "x") [Var (Just (3,21)-(3,22)) "y"]]) Nothing
Var (Just (3,40)-(3,41)) "x"
*)

(* typed spans
(3,12)-(3,23)
(3,40)-(3,41)
*)

(* correct types
'a -> 'a
'a
*)

(* bad types
'a
'a -> 'b
*)
