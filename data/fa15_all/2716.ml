
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun f  -> fun x  -> x = (f x)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,29)-(4,60)
EMPTY
EmptyG

(4,40)-(4,59)
fun y -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(4,50)-(4,51)
b
VarG

(4,50)-(4,59)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(4,57)-(4,58)
EMPTY
EmptyG

*)
