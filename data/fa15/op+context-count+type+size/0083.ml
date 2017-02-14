
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,22)-(6,28)
(6,22)-(6,49)
(6,31)-(6,32)
(6,31)-(6,44)
(6,31)-(6,49)
(6,36)-(6,39)
(6,36)-(6,44)
(6,43)-(6,44)
(6,48)-(6,49)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(6,22)-(6,28)
(6,22)-(6,49)
(6,31)-(6,44)
(6,31)-(6,49)
*)