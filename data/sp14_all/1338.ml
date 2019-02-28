
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "y") (Var (Just (2,28)-(2,29)) "y") Nothing
*)

(* typed spans
(2,24)-(2,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'b
*)
