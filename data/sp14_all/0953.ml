
let sqsum xs =
  let f a x sum x = sum + (x * x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,33)
EMPTY
EmptyG

(3,16)-(3,33)
EMPTY
EmptyG

(3,20)-(3,23)
a
VarG

*)
