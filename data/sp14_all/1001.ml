
let pipe fs = let f a x = a x in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun a -> fun x -> a x
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (3,12)-(3,21)) (VarPat (Just (3,12)-(3,13)) "a") (Lam (Just (3,14)-(3,21)) (VarPat (Just (3,14)-(3,15)) "x") (App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "a") [Var (Just (3,20)-(3,21)) "x"]) Nothing) Nothing
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
