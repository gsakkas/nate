
let pipe fs =
  let f a x mb x = a x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,22)
EMPTY
EmptyG

(3,15)-(3,22)
EMPTY
EmptyG

(3,19)-(3,20)
EMPTY
EmptyG

(3,19)-(3,22)
EMPTY
EmptyG

*)
