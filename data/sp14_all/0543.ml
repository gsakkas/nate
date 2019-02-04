
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,45)
EMPTY
EmptyG

(4,30)-(4,31)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,47)-(4,48)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

*)
