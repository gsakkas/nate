
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (if b = (f b) then (b, false) else (((f b), true), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,8)
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,2)-(6,63)
EMPTY
EmptyG

(6,9)-(6,63)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,45)-(6,58)
EMPTY
EmptyG

(6,46)-(6,51)
EMPTY
EmptyG

(6,47)-(6,48)
EMPTY
EmptyG

(6,60)-(6,61)
wwhile (helper , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
