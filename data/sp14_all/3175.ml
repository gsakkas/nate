
let pipe fs = let f a x = a + x in let base a = a in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,31)
EMPTY
EmptyG

(2,44)-(2,49)
EMPTY
EmptyG

(2,48)-(2,49)
fun x -> x
LamG VarG

(2,53)-(2,77)
x
VarG

*)
