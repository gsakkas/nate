
let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,73)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
LamG (LamG EmptyG)

(3,8)-(3,9)
fun b ->
  (f b , if f b = b
         then true
         else false)
LamG (TupleG (fromList [EmptyG]))

(3,31)-(3,73)
b
VarG

(3,34)-(3,38)
EMPTY
EmptyG

(3,44)-(3,55)
EMPTY
EmptyG

(3,45)-(3,48)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(3,50)-(3,54)
f b
AppG (fromList [VarG])

(3,61)-(3,73)
EMPTY
EmptyG

(3,62)-(3,65)
EMPTY
EmptyG

(8,29)-(8,47)
fixpointHelper f b
AppG (fromList [VarG])

*)
