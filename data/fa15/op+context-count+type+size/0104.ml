
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (true, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,28)-(7,32)
(7,34)-(7,35)
(7,42)-(7,51)
(7,43)-(7,47)
(7,49)-(7,50)
(7,55)-(7,71)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,31)
(4,30)-(4,38)
(4,30)-(4,38)
(4,34)-(4,38)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(7,71)
(7,11)-(7,51)
(7,15)-(7,51)
(7,27)-(7,36)
(7,34)-(7,35)
(7,55)-(7,61)
(7,55)-(7,71)
(7,62)-(7,71)
(7,63)-(7,67)
*)
