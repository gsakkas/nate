
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base f = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,6)-(2,32)
EMPTY
EmptyG

(2,10)-(2,18)
EMPTY
EmptyG

(2,10)-(2,32)
EMPTY
EmptyG

(2,19)-(2,32)
EMPTY
EmptyG

(4,26)-(4,27)
EMPTY
EmptyG

(4,26)-(4,29)
EMPTY
EmptyG

(4,46)-(4,47)
fun x -> x
LamG VarG

*)
