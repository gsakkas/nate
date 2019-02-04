
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile (fun x  -> (((f b), (not (b = (f b)))), b));;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (not (b = (f b))))), b);;

*)

(* changed spans
(4,28)-(4,71)
EMPTY
EmptyG

(4,40)-(4,66)
fun x -> (f b , not (b = f b))
LamG (TupleG (fromList [EmptyG]))

*)
