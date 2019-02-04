
let pipe fs = let f a x = a x in let base = f in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,73)
fun l ->
  List.map string_of_int
LamG (AppG (fromList [EmptyG]))

(2,26)-(2,29)
EMPTY
EmptyG

(2,28)-(2,29)
EMPTY
EmptyG

(2,44)-(2,45)
x
VarG

*)
