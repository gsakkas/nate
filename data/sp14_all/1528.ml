
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,20)
EMPTY
EmptyG

(3,16)-(3,18)
EMPTY
EmptyG

(3,19)-(3,20)
EMPTY
EmptyG

*)
