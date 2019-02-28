
let pipe fs = let f a x = x in let base = fs in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,72)
fun l ->
  List.map string_of_int
LamG (AppG (fromList [EmptyG]))

(2,26)-(2,27)
a
VarG

(2,42)-(2,44)
x
VarG

*)

(* typed spans
't3 -> int list -> string list
't3 -> int list -> string list
't3 -> int list -> string list
*)
