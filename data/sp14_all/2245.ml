
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(3,23)-(3,60)
EMPTY
EmptyG

(3,26)-(3,29)
match c' with
| false -> b'
| _ -> wwhile (f , b')
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(3,26)-(3,32)
EMPTY
EmptyG

(5,29)-(5,31)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(5,33)-(5,34)
if f b = b
then (b , true)
else (b , false)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)
