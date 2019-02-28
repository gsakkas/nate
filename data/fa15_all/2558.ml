
let pipe fs = let f a x = fs a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,32)
fun b -> x (a b)
LamG (AppG (fromList [EmptyG]))

(2,47)-(2,48)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "b") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "b"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "x") (Var (Just (3,40)-(3,41)) "x") Nothing
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
int
int
*)
