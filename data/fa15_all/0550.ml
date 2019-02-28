
let pipe fs =
  let f a x = a fs in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,18)
fun x -> fun a -> x a
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (3,12)-(3,21)) (VarPat (Just (3,12)-(3,13)) "x") (Lam (Just (3,14)-(3,21)) (VarPat (Just (3,14)-(3,15)) "a") (App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "x") [Var (Just (3,20)-(3,21)) "a"]) Nothing) Nothing
*)

(* typed spans
(3,12)-(3,21)
*)

(* correct types
('a -> 'b) -> 'a -> 'b
*)

(* bad types
'a
*)
