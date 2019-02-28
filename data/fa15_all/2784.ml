
let pipe fs = let f a x = a x in let base = f in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,73)
fun l ->
  List.map string_of_int
LamG (AppG (fromList [EmptyG]))

(2,26)-(2,29)
a
VarG

(2,44)-(2,45)
x
VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,32)) (VarPat (Just (2,6)-(2,7)) "l") (App (Just (2,10)-(2,32)) (Var (Just (2,10)-(2,18)) "List.map") [Var (Just (2,19)-(2,32)) "string_of_int"]) Nothing
Var (Just (4,26)-(4,27)) "a"
Var (Just (4,42)-(4,43)) "x"
*)

(* typed spans
(2,6)-(2,32)
(4,26)-(4,27)
(4,42)-(4,43)
*)

(* correct types
'a -> int list -> string list
'a -> int list -> string list
'a -> int list -> string list
*)

(* bad types
'a -> 'b
'a
('a -> 'b) -> 'a -> 'b
*)
