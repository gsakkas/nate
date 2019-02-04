
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(7,55)-(7,58)
EMPTY
EmptyG

(7,61)-(7,62)
EMPTY
EmptyG

*)
