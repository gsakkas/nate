
let pipe fs = let f a x n = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> a) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
(fun n -> a) x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,14)-(3,29)) (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "n") (Var (Just (3,25)-(3,26)) "a") Nothing) [Var (Just (3,28)-(3,29)) "x"]
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
