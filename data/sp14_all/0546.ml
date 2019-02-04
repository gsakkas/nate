
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((failwith "asd"), (failwith "asd")), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,65)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,31)-(4,39)
EMPTY
EmptyG

(4,40)-(4,45)
f
VarG

(4,48)-(4,64)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(4,49)-(4,57)
EMPTY
EmptyG

(4,58)-(4,63)
f
VarG

*)
