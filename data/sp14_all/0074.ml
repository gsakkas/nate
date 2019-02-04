
let pipe fs =
  let f a x c = x (c a) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,23)
EMPTY
EmptyG

(3,21)-(3,22)
EMPTY
EmptyG

*)
