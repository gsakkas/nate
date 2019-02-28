
let pipe fs = let f a x a x = a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun x -> fun a -> x a
LamG (LamG EmptyG)

(2,46)-(2,47)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,21)) (VarPat (Just (3,12)-(3,13)) "x") (Lam (Just (3,14)-(3,21)) (VarPat (Just (3,14)-(3,15)) "a") (App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "x") [Var (Just (3,20)-(3,21)) "a"]) Nothing) Nothing
Lam (Just (3,34)-(3,39)) (VarPat (Just (3,34)-(3,35)) "x") (Var (Just (3,38)-(3,39)) "x") Nothing
*)

(* typed spans
(3,12)-(3,21)
(3,34)-(3,39)
*)

(* correct types
('a -> 'b) -> 'a -> 'b
('a -> 'b) -> 'a -> 'b
*)

(* bad types
'a -> 'b -> 'a
int
*)
