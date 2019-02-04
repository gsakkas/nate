
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun f  -> fun b  -> ((f, ((f b) <> b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,72)
EMPTY
EmptyG

(6,39)-(6,71)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,49)-(6,71)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,50)-(6,67)
true
LitG

(6,51)-(6,52)
EMPTY
EmptyG

(6,54)-(6,66)
EMPTY
EmptyG

(6,56)-(6,57)
EMPTY
EmptyG

(6,58)-(6,59)
func
VarG

*)
