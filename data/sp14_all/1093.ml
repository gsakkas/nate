
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> fun t  -> x (a t)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,57)
EMPTY
EmptyG

(3,18)-(3,57)
EMPTY
EmptyG

(3,29)-(3,56)
EMPTY
EmptyG

(3,39)-(3,56)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,54)-(3,55)
y
VarG

*)
