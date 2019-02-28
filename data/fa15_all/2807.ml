
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let f a x = x a;;

let f a = f;;

let pipe fs = let f a x x a = f in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,75)
fun a -> fun x -> x a
LamG (LamG EmptyG)

(2,9)-(2,75)
fun a -> f
LamG VarG

(2,28)-(2,29)
fun a -> f
LamG VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,15)) (VarPat (Just (2,6)-(2,7)) "a") (Lam (Just (2,8)-(2,15)) (VarPat (Just (2,8)-(2,9)) "x") (App (Just (2,12)-(2,15)) (Var (Just (2,12)-(2,13)) "x") [Var (Just (2,14)-(2,15)) "a"]) Nothing) Nothing
Lam (Just (4,6)-(4,11)) (VarPat (Just (4,6)-(4,7)) "a") (Var (Just (4,10)-(4,11)) "f") Nothing
Lam (Just (6,26)-(6,31)) (VarPat (Just (6,26)-(6,27)) "a") (Var (Just (6,30)-(6,31)) "f") Nothing
*)

(* typed spans
(2,6)-(2,15)
(4,6)-(4,11)
(6,26)-(6,31)
*)

(* correct types
'a -> ('a -> 'b) -> 'b
'a -> 'b -> ('b -> 'c) -> 'c
'a -> 'b -> 'c -> ('c -> 'd) -> 'd
*)

(* bad types
'a -> 'b
'a -> 'b
'a
*)
