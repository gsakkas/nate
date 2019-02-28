
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(4,26)-(4,29)
a
VarG

*)

(* changed exprs
Var (Just (4,26)-(4,27)) "a"
*)

(* typed spans
(4,26)-(4,27)
*)

(* correct types
'a -> int list -> string list
*)

(* bad types
'a
*)
