
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun f ->
  fun x ->
    fun f -> fun a -> f a x
LamG (LamG EmptyG)

(2,44)-(2,46)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,27)) (VarPat (Just (3,12)-(3,13)) "f") (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,14)-(3,15)) "x") (Lam (Just (3,16)-(3,27)) (VarPat (Just (3,16)-(3,17)) "f") (Lam (Just (3,18)-(3,27)) (VarPat (Just (3,18)-(3,19)) "a") (App (Just (3,22)-(3,27)) (Var (Just (3,22)-(3,23)) "f") [Var (Just (3,24)-(3,25)) "a",Var (Just (3,26)-(3,27)) "x"]) Nothing) Nothing) Nothing) Nothing
Lam (Just (3,40)-(3,45)) (VarPat (Just (3,40)-(3,41)) "y") (Var (Just (3,44)-(3,45)) "y") Nothing
*)

(* typed spans
(3,12)-(3,27)
(3,40)-(3,45)
*)

(* correct types
('a -> ('b -> 'a -> 'c) -> 'b -> 'c) -> 'a -> ('b -> 'a -> 'c) -> 'b -> 'c
('a -> ('b -> 'a -> 'c) -> 'b -> 'c) -> 'a -> ('b -> 'a -> 'c) -> 'b -> 'c
*)

(* bad types
'a
'a list
*)
