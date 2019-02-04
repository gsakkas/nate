
let fixpointHelper (f,b) = if (f b) = b then (b, true) else (b, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,20)-(2,70)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
LamG (LamG EmptyG)

(2,27)-(2,70)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
LamG (LamG EmptyG)

(2,45)-(2,54)
EMPTY
EmptyG

(2,46)-(2,47)
EMPTY
EmptyG

(2,60)-(2,70)
EMPTY
EmptyG

(2,61)-(2,62)
EMPTY
EmptyG

(7,29)-(7,52)
fixpointHelper f b
AppG (fromList [VarG])

(7,45)-(7,51)
EMPTY
EmptyG

*)
