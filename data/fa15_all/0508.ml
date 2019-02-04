
let pipe fs =
  let f a x result = a x in let base = f 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,24)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(3,21)-(3,22)
EMPTY
EmptyG

(3,28)-(3,70)
EMPTY
EmptyG

(3,39)-(3,40)
a
VarG

(3,41)-(3,42)
let base = fun f -> 0 in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
