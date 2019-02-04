
let sqsum xs =
  let f a x a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,29)
EMPTY
EmptyG

(3,14)-(3,29)
EMPTY
EmptyG

*)
