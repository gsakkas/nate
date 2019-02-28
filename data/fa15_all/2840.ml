
let pipe fs = let f a x = a x in let base f a = a in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a ->
  fun x -> fun x -> fun a -> a x
LamG (LamG EmptyG)

(2,26)-(2,29)
fun g -> f a x
LamG (AppG (fromList [EmptyG]))

(2,44)-(2,49)
f
VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,19)) (VarPat (Just (2,6)-(2,7)) "a") (Lam (Just (2,8)-(2,19)) (VarPat (Just (2,8)-(2,9)) "x") (Lam (Just (2,10)-(2,19)) (VarPat (Just (2,10)-(2,11)) "x") (Lam (Just (2,12)-(2,19)) (VarPat (Just (2,12)-(2,13)) "a") (App (Just (2,16)-(2,19)) (Var (Just (2,16)-(2,17)) "a") [Var (Just (2,18)-(2,19)) "x"]) Nothing) Nothing) Nothing) Nothing
Lam (Just (5,12)-(5,21)) (VarPat (Just (5,12)-(5,13)) "g") (App (Just (5,16)-(5,21)) (Var (Just (5,16)-(5,17)) "f") [Var (Just (5,18)-(5,19)) "a",Var (Just (5,20)-(5,21)) "x"]) Nothing
Var (Just (5,38)-(5,39)) "f"
*)

(* typed spans
(2,6)-(2,19)
(5,12)-(5,21)
(5,38)-(5,39)
*)

(* correct types
(('a -> ('a -> 'b) -> 'b) -> 'a -> ('a -> 'b) -> 'b) -> 'c -> 'a -> ('a -> 'b) -> 'b
('a -> ('a -> 'b) -> 'b) -> 'a -> ('a -> 'b) -> 'b
'a -> ('a -> 'b) -> 'b
*)

(* bad types
'a -> 'b
'a
'a -> 'a
*)
