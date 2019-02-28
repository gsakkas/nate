
let pipe fs =
  let f a x f x f a = f a x in let base y z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,27)
fun z -> x (a z)
LamG (AppG (fromList [EmptyG]))

(3,40)-(3,47)
fun z -> z
LamG VarG

(3,40)-(3,47)
z
VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "z") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "z"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "z") (Var (Just (3,40)-(3,41)) "z") Nothing
Var (Just (3,40)-(3,41)) "z"
*)

(* typed spans
(3,12)-(3,23)
(3,36)-(3,41)
(3,40)-(3,41)
*)

(* correct types
'a -> 'a
'a -> 'a
'a
*)

(* bad types
'a -> 'b -> ('c -> 'b -> 'd) -> 'c -> 'd
'a -> 'b -> 'b
'a -> 'b -> 'b
*)
