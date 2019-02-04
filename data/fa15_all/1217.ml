
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,17)
EMPTY
EmptyG

(3,32)-(3,39)
EMPTY
EmptyG

(3,32)-(3,42)
EMPTY
EmptyG

(3,40)-(3,42)
fun x -> x
LamG VarG

(3,46)-(3,70)
x
VarG

*)
