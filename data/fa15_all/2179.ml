
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(2,30)-(2,31)
a y
AppG (fromList [VarG])

(2,35)-(2,77)
EMPTY
EmptyG

(2,44)-(2,49)
EMPTY
EmptyG

(2,53)-(2,77)
let base = fun x -> x in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
