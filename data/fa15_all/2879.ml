
let sqsum xs =
  let f a x = (a ** 2) + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,22)
EMPTY
EmptyG

(3,17)-(3,19)
a * a
BopG VarG VarG

(3,20)-(3,21)
EMPTY
EmptyG

(3,25)-(3,33)
EMPTY
EmptyG

(3,26)-(3,27)
x * x
BopG VarG VarG

(3,28)-(3,30)
a
VarG

(3,31)-(3,32)
x
VarG

*)
