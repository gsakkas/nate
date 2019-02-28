
let pipe fs =
  let f a x = List.rev x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,24)
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
'a list
*)
