
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
EMPTY
EmptyG

(3,27)-(3,69)
k
VarG

*)
