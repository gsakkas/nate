
let sqsum xs =
  let f a x = a + (x * x) in let base x = x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,38)-(3,43)
EMPTY
EmptyG

(3,42)-(3,43)
0
LitG

*)
