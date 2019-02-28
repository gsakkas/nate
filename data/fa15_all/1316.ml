
let pipe fs =
  let f a x x a = x a in let base f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
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
'a -> int
*)

(* bad types
('a -> 'b) -> 'a -> 'b
*)
