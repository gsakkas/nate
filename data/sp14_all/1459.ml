
let rec wwhile (f,b) =
  let (x,y) = b f in if y = true then wwhile (f, x) else x;;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in if y = true then wwhile (f, x) else x;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,21)-(3,58)
b
VarG

*)
