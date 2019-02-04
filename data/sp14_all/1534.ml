
let sqsum xs =
  let f a x = (a * a) + x in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,25)
EMPTY
EmptyG

(3,24)-(3,25)
EMPTY
EmptyG

(3,42)-(3,43)
8
LitG

*)
