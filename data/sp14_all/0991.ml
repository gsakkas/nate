
let a = 20;;

let f x = let y = 1 in let g z = y + z in a + (g x);;

let pipe fs = let f a x = f a x in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(6,26)-(6,31)
fun x -> x
LamG VarG

(6,46)-(6,47)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "x") (Var (Just (2,28)-(2,29)) "x") Nothing
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "x") (Var (Just (2,46)-(2,47)) "x") Nothing
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
int
int
*)
