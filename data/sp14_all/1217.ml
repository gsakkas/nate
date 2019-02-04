
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f x = wwhile (f, x) in f b), b);;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> (x, (x = b))), b);;

*)

(* changed spans
(5,29)-(5,61)
EMPTY
EmptyG

(5,40)-(5,46)
EMPTY
EmptyG

(5,40)-(5,53)
EMPTY
EmptyG

(5,48)-(5,49)
EMPTY
EmptyG

(5,57)-(5,58)
x = b
BopG VarG VarG

(5,57)-(5,60)
EMPTY
EmptyG

(5,59)-(5,60)
x
VarG

*)
