
let pipe fs =
  let f a x n fs = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,20)
(fun a -> x) x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,14)-(3,29)) (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "a") (Var (Just (3,25)-(3,26)) "x") Nothing) [Var (Just (3,28)-(3,29)) "x"]
*)

(* typed spans
(3,14)-(3,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b -> 'c
*)
