
let pipe fs =
  let f a x h x = x a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x = a x in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
fun x -> a x
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,19)) (VarPat (Just (3,12)-(3,13)) "x") (App (Just (3,16)-(3,19)) (Var (Just (3,16)-(3,17)) "a") [Var (Just (3,18)-(3,19)) "x"]) Nothing
*)

(* typed spans
(3,12)-(3,19)
*)

(* correct types
'a -> 'b -> 'b
*)

(* bad types
'a -> ('b -> 'c) -> 'c
*)
