
let pipe fs = let f a x = x a in let base = f fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = f in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
x
VarG

(2,44)-(2,48)
f
VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
Var (Just (2,42)-(2,43)) "f"
*)

(* typed spans
(2,26)-(2,27)
(2,42)-(2,43)
*)

(* correct types
'a
'a -> 'a -> 'a
*)

(* bad types
'a
('a -> 'a) -> 'a
*)
