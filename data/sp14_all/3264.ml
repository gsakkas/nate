
let sqsum xs =
  let f a x x = x * x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

*)
