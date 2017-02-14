
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in match t with | false  -> h | true  -> wwhile (f, h);;


(* fix

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

*)

(* changed spans
(3,3)-(4,69)
(3,11)-(3,17)
(3,19)-(3,23)
(4,3)-(4,69)
(4,14)-(4,15)
(4,25)-(4,26)
(4,44)-(4,45)
(4,57)-(4,69)
*)

(* type error slice
(3,3)-(4,69)
(3,11)-(3,17)
(3,11)-(3,23)
(4,3)-(4,69)
(4,3)-(4,69)
(4,3)-(4,69)
(4,14)-(4,15)
(4,19)-(4,69)
(4,19)-(4,69)
(4,19)-(4,69)
(4,19)-(4,69)
(4,19)-(4,69)
(4,19)-(4,69)
(4,25)-(4,26)
(4,44)-(4,45)
(4,57)-(4,63)
(4,57)-(4,69)
*)