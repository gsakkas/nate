
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> x (a g) in
  let base = function | b -> b in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,34)
EMPTY
EmptyG

(4,2)-(4,58)
g
VarG

*)
