
let pipe fs = let f a x x a = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,33)
a
VarG

(2,37)-(2,77)
fun f -> 0
LamG LitG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "a"
Lam (Just (2,40)-(2,45)) (VarPat (Just (2,40)-(2,41)) "f") (Lit (Just (2,44)-(2,45)) (LI 0)) Nothing
*)

(* typed spans
(2,26)-(2,27)
(2,40)-(2,45)
*)

(* correct types
'a -> int
'a -> int
*)

(* bad types
('a -> 'b) -> 'a -> 'b
'a
*)
