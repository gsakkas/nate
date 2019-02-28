
let pipe fs =
  let f a x t = t (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
fun q -> x q
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "q") (App (Just (2,28)-(2,31)) (Var (Just (2,28)-(2,29)) "x") [Var (Just (2,30)-(2,31)) "q"]) Nothing
*)

(* typed spans
(2,24)-(2,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
*)
