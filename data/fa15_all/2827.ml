
let pipe fs = let f a x a = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
a
VarG

(2,44)-(2,49)
fun f -> f
LamG VarG

*)

(* changed exprs
Var (Just (2,28)-(2,29)) "a"
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "f") (Var (Just (2,46)-(2,47)) "f") Nothing
*)

(* typed spans
(2,28)-(2,29)
(2,42)-(2,47)
*)

(* correct types
'a
'a -> 'a
*)

(* bad types
'a
('a -> 'b) -> 'a -> 'b
*)
