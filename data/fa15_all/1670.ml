
let sqsum xs =
  let f a x x = (x * x) + a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,27)
EMPTY
EmptyG

(3,42)-(3,44)
0
LitG

*)
