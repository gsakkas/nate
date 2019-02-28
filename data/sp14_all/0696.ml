
let pipe fs =
  let f a x (x,a) = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,21)
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
'a -> 'a
*)

(* bad types
('a * 'b) -> 'b
*)
