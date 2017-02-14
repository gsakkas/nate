
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let g b = (f, ((f b) = b)) in g), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(4,31)-(4,62)
(4,31)-(4,66)
(4,37)-(4,55)
(4,42)-(4,43)
(4,42)-(4,55)
(4,47)-(4,50)
(4,47)-(4,55)
(4,49)-(4,50)
(4,54)-(4,55)
(4,61)-(4,62)
*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,69)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,66)
(4,31)-(4,62)
(4,31)-(4,62)
(4,31)-(4,66)
(4,37)-(4,55)
(4,42)-(4,43)
(4,42)-(4,55)
(4,47)-(4,48)
(4,47)-(4,50)
(4,49)-(4,50)
(4,61)-(4,62)
*)
