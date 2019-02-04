
let sqsum xs =
  let f a x = ((+) a) * a in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 9 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,21)
EMPTY
EmptyG

(3,15)-(3,18)
EMPTY
EmptyG

(3,42)-(3,43)
9
LitG

*)
