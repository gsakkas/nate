
let pipe fs = let f a x = a x in let base a = f a in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = a (x z) in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun z -> a (x z)
LamG (AppG (fromList [EmptyG]))

(2,46)-(2,49)
a
VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "z") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "a") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "x") [Var (Just (3,21)-(3,22)) "z"]]) Nothing
Var (Just (3,40)-(3,41)) "a"
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
