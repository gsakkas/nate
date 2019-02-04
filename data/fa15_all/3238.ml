
let pipe fs =
  let f a x h x = x a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x = a x in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,25)-(3,69)
x
VarG

*)
