
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
(fun a -> x) a
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,14)-(3,29)) (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "a") (Var (Just (3,25)-(3,26)) "x") Nothing) [Var (Just (3,28)-(3,29)) "a"]
*)

(* typed spans
(3,14)-(3,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b
*)
