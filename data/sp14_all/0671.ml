
let pipe fs = let f a x x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,14)-(3,21)) (VarPat (Just (3,14)-(3,15)) "a") (App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "x") [Var (Just (3,20)-(3,21)) "a"]) Nothing
*)

(* typed spans
(3,14)-(3,21)
*)

(* correct types
'a -> 'b
*)

(* bad types
'a
*)
