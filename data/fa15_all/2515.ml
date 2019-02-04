
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func), b);;

*)

(* changed spans
(6,53)-(6,59)
EMPTY
EmptyG

(6,62)-(6,63)
EMPTY
EmptyG

*)
