
let pipe fs =
  let f a x y c = a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,19)
EMPTY
EmptyG

(3,14)-(3,19)
EMPTY
EmptyG

*)
