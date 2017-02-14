
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (f, (x = (f x))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(7,11)-(7,60)
(7,21)-(7,48)
(7,30)-(7,31)
(7,36)-(7,37)
(7,40)-(7,48)
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
(7,3)-(7,9)
(7,3)-(7,60)
(7,11)-(7,60)
(7,11)-(7,60)
(7,17)-(7,48)
(7,21)-(7,48)
(7,36)-(7,37)
(7,36)-(7,48)
(7,45)-(7,46)
(7,45)-(7,48)
(7,47)-(7,48)
(7,56)-(7,57)
(7,56)-(7,60)
*)