
let pipe fs =
  let f a x a x = x a in let base d = d in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base d = d in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
EMPTY
EmptyG

*)
