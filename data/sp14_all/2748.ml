
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> x (a g) in
  let base = function | b -> b in List.fold_left f base fs;;

*)

(* changed spans
(3,35)-(3,36)
g
VarG

*)

(* changed exprs
Var (Just (3,35)-(3,36)) "g"
*)

(* typed spans
(3,35)-(3,36)
*)

(* correct types
'a
*)

(* bad types
'a
*)
