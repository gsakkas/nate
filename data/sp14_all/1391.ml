
let pipe fs =
  let f a x f x = f a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,21)
fun f -> fun a -> f a x
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (3,16)-(3,27)) (VarPat (Just (3,16)-(3,17)) "f") (Lam (Just (3,18)-(3,27)) (VarPat (Just (3,18)-(3,19)) "a") (App (Just (3,22)-(3,27)) (Var (Just (3,22)-(3,23)) "f") [Var (Just (3,24)-(3,25)) "a",Var (Just (3,26)-(3,27)) "x"]) Nothing) Nothing
*)

(* typed spans
(3,16)-(3,27)
*)

(* correct types
('a -> 'b -> 'c) -> 'a -> 'c
*)

(* bad types
'a
*)
