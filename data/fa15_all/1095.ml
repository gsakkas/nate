
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f List.hd xs x) in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,6)-(2,17)
EMPTY
EmptyG

(2,8)-(2,17)
EMPTY
EmptyG

(2,12)-(2,13)
EMPTY
EmptyG

(2,12)-(2,17)
EMPTY
EmptyG

(2,16)-(2,17)
EMPTY
EmptyG

(5,24)-(5,40)
EMPTY
EmptyG

(5,25)-(5,26)
EMPTY
EmptyG

(5,27)-(5,34)
EMPTY
EmptyG

(5,35)-(5,37)
EMPTY
EmptyG

*)
