
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let func y = x (a y) in func in
  let base = let func y = y in func in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
EMPTY
EmptyG

(2,26)-(2,29)
let func = fun y -> x (a y) in
func
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,33)-(2,74)
a y
AppG (fromList [VarG])

(2,44)-(2,46)
let func = fun y -> y in func
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,50)-(2,74)
fun y -> y
LamG VarG

*)
