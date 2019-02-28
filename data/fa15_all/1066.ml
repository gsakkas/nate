
let pipe fs = let f a x x a = x in let base x = x in List.fold_left f base fs;;


(* fix

let f a x = (a * a) + x;;

let pipe fs =
  let f a x x a = f a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a -> fun x -> (a * a) + x
LamG (LamG EmptyG)

(2,30)-(2,31)
f a
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,6)-(2,23)) (VarPat (Just (2,6)-(2,7)) "a") (Lam (Just (2,8)-(2,23)) (VarPat (Just (2,8)-(2,9)) "x") (Bop (Just (2,12)-(2,23)) Plus (Bop (Just (2,12)-(2,19)) Times (Var (Just (2,13)-(2,14)) "a") (Var (Just (2,17)-(2,18)) "a")) (Var (Just (2,22)-(2,23)) "x")) Nothing) Nothing
App (Just (5,18)-(5,21)) (Var (Just (5,18)-(5,19)) "f") [Var (Just (5,20)-(5,21)) "a"]
*)

(* typed spans
(2,6)-(2,23)
(5,18)-(5,21)
*)

(* correct types
int -> int -> int
int -> int
*)

(* bad types
'a -> 'b
'a
*)
