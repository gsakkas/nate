
let pipe fs =
  let f a x = function | g -> g x in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,33)
g
VarG

*)

(* changed exprs
Var (Just (3,30)-(3,31)) "g"
*)

(* typed spans
(3,30)-(3,31)
*)

(* correct types
'a
*)

(* bad types
'a
*)
