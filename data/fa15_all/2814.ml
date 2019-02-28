
let pipe fs = let f a x = a x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (2,24)-(2,29)) (VarPat (Just (2,24)-(2,25)) "x") (Var (Just (2,28)-(2,29)) "x") Nothing
*)

(* typed spans
(2,24)-(2,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
