
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((wwhile (f, b)), (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,42)-(4,48)
EMPTY
EmptyG

(4,49)-(4,55)
EMPTY
EmptyG

*)
