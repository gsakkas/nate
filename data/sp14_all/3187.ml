
let pipe fs = let f a x = a x in let base = () in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
x
VarG

(2,44)-(2,46)
fun x -> x
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Lam (Just (2,40)-(2,45)) (VarPat (Just (2,40)-(2,41)) "x") (Var (Just (2,44)-(2,45)) "x") Nothing
*)

(* typed spans
(2,26)-(2,27)
(2,40)-(2,45)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
unit
*)
