
let pipe fs =
  let f a x f' d = x (a d) in let base c = c in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x d = x (a d) in let base c = c in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,26)
fun d -> x (a d)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "d") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "d"]]) Nothing
*)

(* typed spans
(3,12)-(3,23)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a -> 'b
*)
