
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun f  -> ((f, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,61)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,39)-(6,60)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,40)-(6,56)
true
LitG

(6,41)-(6,42)
EMPTY
EmptyG

(6,44)-(6,55)
EMPTY
EmptyG

(6,46)-(6,47)
EMPTY
EmptyG

(6,48)-(6,49)
func
VarG

*)
