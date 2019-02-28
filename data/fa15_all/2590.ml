
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> (((wwhile f) * b), (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,41)-(4,57)
EMPTY
EmptyG

(4,43)-(4,49)
EMPTY
EmptyG

*)

(* typed spans
*)

(* typed spans
*)

(* typed spans
*)
