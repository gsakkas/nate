
let pipe fs =
  let f a x = function | g -> a (g x) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> a (x g) in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,34)
EMPTY
EmptyG

(4,2)-(4,58)
g
VarG

*)
