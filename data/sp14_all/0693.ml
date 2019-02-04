
let pipe fs =
  let f a x (a,x) = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,23)
EMPTY
EmptyG

(3,20)-(3,23)
EMPTY
EmptyG

(3,22)-(3,23)
EMPTY
EmptyG

*)
