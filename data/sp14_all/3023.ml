
let pipe fs = let f a x = a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun x -> x
LamG VarG

(2,42)-(2,47)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "x") (Var (Just (2,28)-(2,29)) "x") Nothing
Lam (Just (2,42)-(2,47)) (VarPat (Just (2,42)-(2,43)) "y") (Var (Just (2,46)-(2,47)) "y") Nothing
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
'a
'a -> 'a
*)
