
let f a x = a * a;;

let sqsum xs =
  let f a x = let aa = a * a in aa + f in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,6)-(2,17)
EMPTY
EmptyG

(5,14)-(5,38)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(5,32)-(5,38)
x * x
BopG VarG VarG

(6,2)-(6,51)
x
VarG

*)

(* typed spans
(3,14)-(3,31)
(3,24)-(3,31)
(3,29)-(3,30)
*)

(* typed spans
int
int
int
*)

(* typed spans
int
int
int
*)
