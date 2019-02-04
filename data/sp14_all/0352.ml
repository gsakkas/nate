
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let g x = let d = f x in (d, (x = d)) in g b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let g x = let d = f x in (d, (x = d)) in g), b);;

*)

(* changed spans
(7,52)-(7,55)
EMPTY
EmptyG

(7,58)-(7,59)
EMPTY
EmptyG

*)
