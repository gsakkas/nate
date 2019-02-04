
let sqsum xs =
  let f a x mb x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,30)
EMPTY
EmptyG

(3,15)-(3,30)
EMPTY
EmptyG

*)
