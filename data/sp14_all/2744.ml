
let pipe fs =
  let f a x = function | g -> g (x a) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,37)
EMPTY
EmptyG

(3,32)-(3,37)
EMPTY
EmptyG

(3,33)-(3,34)
EMPTY
EmptyG

(3,35)-(3,36)
EMPTY
EmptyG

*)
