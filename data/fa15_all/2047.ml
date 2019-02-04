
let identity a = a;;

let pipe fs =
  let f a x = a x in let base = identity in List.fold_left f base fs;;


(* fix

let identity a = a;;

let pipe fs =
  let f a x = a in let base = identity in List.fold_left f base fs;;

*)

(* changed spans
(5,14)-(5,17)
EMPTY
EmptyG

(5,16)-(5,17)
EMPTY
EmptyG

*)
