
let pipe fs =
  let f a x p' = a in let base a' = a' in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,18)
a
VarG

(3,31)-(3,38)
fun p -> p
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "a"
Lam (Just (2,40)-(2,45)) (VarPat (Just (2,40)-(2,41)) "p") (Var (Just (2,44)-(2,45)) "p") Nothing
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
'a -> 'b
'a -> 'a
*)
