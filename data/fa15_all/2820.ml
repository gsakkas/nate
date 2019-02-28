
let pipe fs = let f a x x a = x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
a
VarG

(2,44)-(2,49)
fun x -> x
LamG VarG

*)

(* changed exprs
Var (Just (2,30)-(2,31)) "a"
Lam (Just (2,44)-(2,49)) (VarPat (Just (2,44)-(2,45)) "x") (Var (Just (2,48)-(2,49)) "x") Nothing
*)

(* typed spans
(2,30)-(2,31)
(2,44)-(2,49)
*)

(* correct types
'a
('a -> 'a) -> 'a -> 'a
*)

(* bad types
'a
'a -> 'a
*)
