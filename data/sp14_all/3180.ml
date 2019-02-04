
let pipe fs =
  let f a x f = a (f x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
EMPTY
EmptyG

(3,16)-(3,17)
EMPTY
EmptyG

(3,16)-(3,23)
EMPTY
EmptyG

(3,18)-(3,23)
EMPTY
EmptyG

(3,19)-(3,20)
EMPTY
EmptyG

*)
