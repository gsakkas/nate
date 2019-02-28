
let pipe fs = let f a x x a = a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
x a
AppG (fromList [VarG])

(2,46)-(2,47)
fun x -> x
LamG VarG

*)

(* changed exprs
App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "x") [Var (Just (3,20)-(3,21)) "a"]
Lam (Just (3,34)-(3,39)) (VarPat (Just (3,34)-(3,35)) "x") (Var (Just (3,38)-(3,39)) "x") Nothing
*)

(* typed spans
(3,18)-(3,21)
(3,34)-(3,39)
*)

(* correct types
'a
('a -> 'b) -> 'a -> 'b
*)

(* bad types
'a
int
*)
