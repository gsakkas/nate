
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (if b = (f b) then true else (false, b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,30)-(3,63)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(5,28)-(5,68)
EMPTY
EmptyG

(5,32)-(5,33)
EMPTY
EmptyG

(5,32)-(5,41)
EMPTY
EmptyG

(5,36)-(5,41)
EMPTY
EmptyG

(5,37)-(5,38)
EMPTY
EmptyG

(5,39)-(5,40)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,47)-(5,51)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(5,58)-(5,63)
func b
AppG (fromList [VarG])

(5,65)-(5,66)
func
VarG

*)
