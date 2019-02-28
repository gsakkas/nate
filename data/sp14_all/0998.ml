
let pipe fs = let f a x x = x a in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
fun a -> a
LamG VarG

*)

(* changed exprs
Lam (Just (2,26)-(2,31)) (VarPat (Just (2,26)-(2,27)) "a") (Var (Just (2,30)-(2,31)) "a") Nothing
*)

(* typed spans
(2,26)-(2,31)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
