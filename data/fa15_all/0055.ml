
let pipe fs = let f a x = a x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x r a x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun r -> fun a -> fun x -> a x
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "r") (Lam (Just (3,14)-(3,23)) (VarPat (Just (3,14)-(3,15)) "a") (Lam (Just (3,16)-(3,23)) (VarPat (Just (3,16)-(3,17)) "x") (App (Just (3,20)-(3,23)) (Var (Just (3,20)-(3,21)) "a") [Var (Just (3,22)-(3,23)) "x"]) Nothing) Nothing) Nothing
*)

(* typed spans
(3,12)-(3,23)
*)

(* correct types
(('a -> 'b) -> 'a -> 'b) -> ('a -> 'b) -> 'a -> 'b
*)

(* bad types
'a
*)
