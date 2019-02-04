
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,39)
EMPTY
EmptyG

(3,20)-(3,22)
EMPTY
EmptyG

(4,13)-(4,14)
EMPTY
EmptyG

(4,13)-(4,17)
EMPTY
EmptyG

(4,15)-(4,17)
fun y -> y
LamG VarG

(4,21)-(4,45)
y
VarG

*)
