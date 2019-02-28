
let pipe fs =
  let f a x y z = z y in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun fn -> x (fun a -> a)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,32)) (VarPat (Just (3,12)-(3,14)) "fn") (App (Just (3,17)-(3,32)) (Var (Just (3,17)-(3,18)) "x") [Lam (Just (3,19)-(3,32)) (VarPat (Just (3,24)-(3,25)) "a") (Var (Just (3,30)-(3,31)) "a") Nothing]) Nothing
*)

(* typed spans
(3,12)-(3,32)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> ('a -> 'b) -> 'b
*)
