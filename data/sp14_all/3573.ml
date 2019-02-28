
let pipe fs =
  let f a x = a x in let base x y = x y in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x y = x y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
x
VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "x"
*)

(* typed spans
(2,26)-(2,27)
*)

(* correct types
('a -> 'b) -> 'a -> 'b
*)

(* bad types
'a
*)
