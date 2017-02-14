
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n b = (f, (b = (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,30)-(6,65)
(6,36)-(6,53)
(6,41)-(6,42)
(6,41)-(6,53)
(6,45)-(6,46)
(6,45)-(6,53)
(6,50)-(6,53)
(6,61)-(6,62)
*)

(* type error slice
(2,4)-(4,74)
(2,17)-(4,72)
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,64)
(4,60)-(4,64)
(4,63)-(4,64)
(6,22)-(6,28)
(6,22)-(6,65)
(6,30)-(6,65)
(6,30)-(6,65)
(6,36)-(6,53)
(6,41)-(6,42)
(6,41)-(6,53)
(6,50)-(6,51)
(6,50)-(6,53)
(6,52)-(6,53)
(6,61)-(6,62)
(6,61)-(6,65)
*)
