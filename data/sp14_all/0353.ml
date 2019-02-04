
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (func, boo) else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,48)-(4,52)
EMPTY
EmptyG

(4,54)-(4,57)
f
VarG

*)
