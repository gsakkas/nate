
let sqsum xs =
  let f a x = a ^ (2 + x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,25)
EMPTY
EmptyG

(3,16)-(3,17)
EMPTY
EmptyG

(3,19)-(3,20)
a * a
BopG VarG VarG

(3,23)-(3,24)
a
VarG

*)
