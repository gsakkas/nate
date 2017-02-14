
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x not) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,31)-(4,72)
(4,52)-(4,59)
(4,52)-(4,64)
(4,56)-(4,59)
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
(4,22)-(4,76)
(4,31)-(4,72)
(4,31)-(4,72)
(4,31)-(4,76)
(4,38)-(4,64)
(4,44)-(4,45)
(4,44)-(4,47)
(4,44)-(4,64)
(4,52)-(4,53)
(4,52)-(4,59)
(4,52)-(4,64)
(4,52)-(4,64)
(4,63)-(4,64)
(4,70)-(4,72)
*)