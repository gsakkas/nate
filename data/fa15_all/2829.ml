
let pipe fs = let f a x x a = x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,30)-(2,31)
fun x -> x
LamG VarG

*)
