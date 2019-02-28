
let pipe fs = let f a x = a x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> fun x -> x
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (2,24)-(2,31)) (VarPat (Just (2,24)-(2,25)) "a") (Lam (Just (2,26)-(2,31)) (VarPat (Just (2,26)-(2,27)) "x") (Var (Just (2,30)-(2,31)) "x") Nothing) Nothing
*)

(* typed spans
(2,24)-(2,31)
*)

(* correct types
('a -> 'a) -> 'a -> 'a
*)

(* bad types
'a
*)
