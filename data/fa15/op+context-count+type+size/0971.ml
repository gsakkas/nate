
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let b' = f b in (b', (b' != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let f' b' = ((f b'), ((f b') != b')) in wwhile (f', b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,66)
(5,28)-(5,66)
(5,29)-(5,62)
(5,41)-(5,42)
(5,46)-(5,61)
(5,52)-(5,54)
(5,58)-(5,59)
(5,64)-(5,65)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,66)
(5,28)-(5,66)
(5,29)-(5,62)
(5,46)-(5,61)
*)
