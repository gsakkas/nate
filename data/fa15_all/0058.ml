
let pipe fs =
  let f a x f' x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,24)
fun a -> fun x -> x a
LamG (LamG EmptyG)

(3,39)-(3,40)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (3,15)-(3,24)) (VarPat (Just (3,15)-(3,16)) "a") (Lam (Just (3,17)-(3,24)) (VarPat (Just (3,17)-(3,18)) "x") (App (Just (3,21)-(3,24)) (Var (Just (3,21)-(3,22)) "x") [Var (Just (3,23)-(3,24)) "a"]) Nothing) Nothing
Lam (Just (3,37)-(3,42)) (VarPat (Just (3,37)-(3,38)) "y") (Var (Just (3,41)-(3,42)) "y") Nothing
*)

(* typed spans
(3,15)-(3,24)
(3,37)-(3,42)
*)

(* correct types
'a -> ('a -> 'b) -> 'b
('a -> ('a -> 'b) -> 'b) -> 'a -> ('a -> 'b) -> 'b
*)

(* bad types
('a -> 'b) -> 'a -> 'b
int
*)
