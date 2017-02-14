
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then b else b in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,27)-(7,28)
(7,34)-(7,35)
(7,39)-(7,59)
(7,47)-(7,55)
(7,57)-(7,58)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(7,2)-(7,59)
(7,11)-(7,35)
(7,15)-(7,35)
(7,27)-(7,28)
(7,39)-(7,45)
(7,39)-(7,59)
(7,46)-(7,59)
(7,47)-(7,55)
(7,48)-(7,52)
(7,53)-(7,54)
(7,57)-(7,58)
*)
