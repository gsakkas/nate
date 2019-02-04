
let sqsum xs =
  let f a x f _ = a * a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,23)
EMPTY
EmptyG

(3,14)-(3,23)
EMPTY
EmptyG

(3,22)-(3,23)
x
VarG

*)
