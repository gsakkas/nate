
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, (f < 100)), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,2)-(3,63)
fun (f , b) ->
  match f b with
  | (b' , c') -> if c'
                 then wwhile (f , b')
                 else b'
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(5,29)-(5,43)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,33)-(5,42)
EMPTY
EmptyG

(5,34)-(5,35)
EMPTY
EmptyG

(5,38)-(5,41)
EMPTY
EmptyG

*)
