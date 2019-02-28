
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun x' -> x (a x')
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,25)) (VarPat (Just (3,12)-(3,14)) "x'") (App (Just (3,17)-(3,25)) (Var (Just (3,17)-(3,18)) "x") [App (Just (3,19)-(3,25)) (Var (Just (3,20)-(3,21)) "a") [Var (Just (3,22)-(3,24)) "x'"]]) Nothing
*)

(* typed spans
(3,12)-(3,25)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> ('a -> 'b) -> 'b
*)
