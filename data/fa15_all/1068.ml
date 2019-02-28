
let pipe fs = let f a x x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
a
VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "a"
*)

(* typed spans
(2,26)-(2,27)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
*)
