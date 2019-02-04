
let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile (0, b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,16)-(3,70)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
LamG (LamG EmptyG)

(5,29)-(5,30)
fixpointHelper f b
AppG (fromList [VarG])

(5,32)-(5,33)
f
VarG

*)
