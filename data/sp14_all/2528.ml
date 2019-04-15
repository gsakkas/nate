
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,55)-(8,63)
helper
VarG

*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(4,19)-(4,20)
(4,19)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,62)-(4,63)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(8,3)-(8,9)
(8,3)-(8,68)
(8,10)-(8,68)
(8,11)-(8,64)
(8,23)-(8,51)
(8,27)-(8,51)
(8,55)-(8,61)
(8,55)-(8,63)
*)
