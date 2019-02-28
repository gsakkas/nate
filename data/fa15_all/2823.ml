
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun a -> a
LamG VarG

(2,42)-(2,47)
fun f -> f
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "a") (Var (Just (2,28)-(2,29)) "a") Nothing
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "f") (Var (Just (2,46)-(2,47)) "f") Nothing
*)

(* typed spans
(2,24)-(2,29)
(2,42)-(2,47)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a -> 'b
'a -> 'a
*)
