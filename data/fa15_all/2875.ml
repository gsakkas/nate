
let pipe fs = let f a x = x in let base y = y in List.fold_right f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,49)-(2,64)
List.fold_left
VarG

*)

(* changed exprs
Var (Just (2,49)-(2,63)) "List.fold_left"
*)

(* typed spans
(2,49)-(2,63)
*)

(* correct types
(('a -> 'a) -> ('a -> 'a) -> 'a -> 'a) -> ('a -> 'a) -> 'a -> 'a list -> 'a -> 'a
*)

(* bad types
('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
*)
