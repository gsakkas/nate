
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,45)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,29)-(6,41)
0
LitG

(6,30)-(6,35)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,31)-(6,32)
EMPTY
EmptyG

(6,33)-(6,34)
func
VarG

*)
