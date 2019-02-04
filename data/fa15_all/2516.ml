
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func), b);;

*)

(* changed spans
(6,63)-(6,69)
EMPTY
EmptyG

(6,72)-(6,73)
EMPTY
EmptyG

*)
