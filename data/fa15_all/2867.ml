
let pipe fs = let f a x a = x a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,46)-(2,48)
fun y -> y
LamG VarG

*)

(* changed exprs
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "y") (Var (Just (2,48)-(2,49)) "y") Nothing
*)

(* typed spans
(2,44)-(2,49)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a list
*)
