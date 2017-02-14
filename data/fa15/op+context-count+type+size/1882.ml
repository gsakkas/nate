
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile (if f = true then b else ((wwhile (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,28)-(5,74)
(5,32)-(5,33)
(5,36)-(5,40)
(5,53)-(5,73)
(5,54)-(5,69)
(5,55)-(5,61)
(5,63)-(5,64)
(5,71)-(5,72)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(3,53)-(3,54)
(5,28)-(5,74)
(5,28)-(5,74)
(5,32)-(5,33)
(5,32)-(5,40)
(5,32)-(5,40)
(5,36)-(5,40)
(5,46)-(5,47)
(5,53)-(5,73)
(5,54)-(5,69)
(5,55)-(5,61)
(5,62)-(5,68)
(5,63)-(5,64)
(5,71)-(5,72)
*)
