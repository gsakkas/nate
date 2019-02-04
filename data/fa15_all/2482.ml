
let sqsum xs =
  let f a x = a + (x * x) in
  let base = 0 "to be implemented" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,34)
EMPTY
EmptyG

(4,15)-(4,34)
EMPTY
EmptyG

*)
