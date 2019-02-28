
let pipe fs = let f a x = a x in let base b x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
x
VarG

(2,42)-(2,49)
fun y -> y
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Lam (Just (2,40)-(2,45)) (VarPat (Just (2,40)-(2,41)) "y") (Var (Just (2,44)-(2,45)) "y") Nothing
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
'a -> 'b -> 'b
*)
