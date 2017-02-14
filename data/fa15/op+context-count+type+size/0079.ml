
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
(7,28)-(7,29)
(7,35)-(7,36)
(7,40)-(7,59)
(7,49)-(7,55)
(7,58)-(7,59)
*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(4,54)-(4,55)
(7,3)-(7,59)
(7,12)-(7,36)
(7,16)-(7,36)
(7,28)-(7,29)
(7,40)-(7,46)
(7,40)-(7,59)
(7,49)-(7,53)
(7,49)-(7,55)
(7,49)-(7,59)
(7,54)-(7,55)
(7,58)-(7,59)
*)