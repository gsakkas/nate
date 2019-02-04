
let pipe fs =
  let f a x x a = x a in let base f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,14)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,18)-(3,21)
EMPTY
EmptyG

*)
