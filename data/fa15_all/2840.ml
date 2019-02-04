
let pipe fs = let f a x = a x in let base f a = a in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,9)-(2,77)
fun a ->
  fun x -> fun x -> fun a -> a x
LamG (LamG EmptyG)

(2,26)-(2,27)
f a x
AppG (fromList [VarG])

(2,26)-(2,29)
fun g -> f a x
LamG (AppG (fromList [EmptyG]))

(2,44)-(2,49)
EMPTY
EmptyG

(2,48)-(2,49)
f
VarG

*)
