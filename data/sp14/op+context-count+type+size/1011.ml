
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(6,55)-(6,56)
*)

(* type error slice
(3,2)-(3,63)
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(6,2)-(6,8)
(6,2)-(6,61)
(6,9)-(6,61)
(6,20)-(6,50)
(6,29)-(6,30)
(6,29)-(6,32)
(6,41)-(6,49)
(6,41)-(6,49)
(6,42)-(6,44)
(6,47)-(6,48)
(6,54)-(6,60)
(6,55)-(6,56)
(6,58)-(6,59)
*)
