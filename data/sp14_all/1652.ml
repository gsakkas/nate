
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,28)-(5,65)
EMPTY
EmptyG

(5,40)-(5,60)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

*)
