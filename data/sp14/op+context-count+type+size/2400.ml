
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b != (f b)
  then let f b = (b, true) in wwhile (f, (f b))
  else wwhile (f b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(8,5)-(8,15)
(9,7)-(9,47)
(9,13)-(9,26)
(9,17)-(9,26)
(9,18)-(9,19)
(9,21)-(9,25)
(9,30)-(9,36)
(9,37)-(9,47)
(9,41)-(9,46)
(10,7)-(10,19)
(10,14)-(10,19)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(5,16)-(5,25)
(5,17)-(5,18)
(8,5)-(8,6)
(8,5)-(8,15)
(8,5)-(8,15)
(8,10)-(8,15)
(8,11)-(8,12)
(9,30)-(9,36)
(9,30)-(9,47)
(9,37)-(9,47)
(9,38)-(9,39)
(9,41)-(9,46)
(9,42)-(9,43)
(9,44)-(9,45)
(10,7)-(10,13)
(10,7)-(10,19)
(10,14)-(10,19)
(10,15)-(10,16)
*)
