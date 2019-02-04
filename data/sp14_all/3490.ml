
let notequals x y = x <> y;;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((notequals b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(2,14)-(2,26)
EMPTY
EmptyG

(2,16)-(2,26)
EMPTY
EmptyG

(2,20)-(2,21)
EMPTY
EmptyG

(2,20)-(2,26)
EMPTY
EmptyG

(2,25)-(2,26)
EMPTY
EmptyG

(5,30)-(5,63)
match c' with
| true -> wwhile (f , b')
| false -> b'
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(7,28)-(7,46)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(7,29)-(7,42)
(func b , b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,30)-(7,39)
func
VarG

*)
