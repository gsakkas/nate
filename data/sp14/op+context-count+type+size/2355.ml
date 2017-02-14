
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let f f b =
        if ((f b) = (b, true)) && ((b, true) = (f (b - 1))) then (b, false) in
      f), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(7,5)-(9,8)
(7,12)-(8,75)
(7,14)-(8,75)
(8,8)-(8,75)
(8,11)-(8,30)
(8,11)-(8,59)
(8,12)-(8,17)
(8,15)-(8,16)
(8,21)-(8,22)
(8,24)-(8,28)
(8,34)-(8,59)
(8,35)-(8,44)
(8,47)-(8,58)
(8,65)-(8,75)
(9,6)-(9,7)
*)

(* type error slice
(3,2)-(3,63)
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(9,12)
(7,4)-(9,12)
(7,5)-(9,8)
(7,5)-(9,8)
(7,12)-(8,75)
(7,14)-(8,75)
(8,8)-(8,75)
(8,8)-(8,75)
(8,8)-(8,75)
(8,65)-(8,75)
(9,6)-(9,7)
*)
