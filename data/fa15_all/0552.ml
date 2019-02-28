
let pipe fs =
  let f a x x = x a in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,19)) (VarPat (Just (3,12)-(3,13)) "a") (App (Just (3,16)-(3,19)) (Var (Just (3,16)-(3,17)) "x") [Var (Just (3,18)-(3,19)) "a"]) Nothing
*)

(* typed spans
(3,12)-(3,19)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
*)
