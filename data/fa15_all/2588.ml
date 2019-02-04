
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile ((fun x  -> ((wwhile (f, b)), (not (b = (f b))))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(5,23)-(5,29)
EMPTY
EmptyG

(5,30)-(5,36)
EMPTY
EmptyG

(5,39)-(5,56)
EMPTY
EmptyG

(5,40)-(5,43)
EMPTY
EmptyG

*)
