
let pipe fs = let f a x a = a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,44)-(2,45)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "x") (Var (Just (2,46)-(2,47)) "x") Nothing
*)

(* typed spans
(2,42)-(2,47)
*)

(* correct types
'a -> 'a
*)

(* bad types
int
*)
