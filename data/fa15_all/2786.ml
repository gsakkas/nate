
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(4,26)-(4,29)
EMPTY
EmptyG

(4,28)-(4,29)
EMPTY
EmptyG

*)
