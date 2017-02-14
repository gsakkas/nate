
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  ((((clone 0 leng1) - leng2) @ l1), (((clone 0 leng2) - leng1) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng1 - leng2)) @ l1), ((clone 0 (leng2 - leng1)) @ l2));;

*)

(* changed spans
(7,4)-(7,29)
(7,14)-(7,19)
(7,38)-(7,63)
(7,48)-(7,53)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(7,3)-(7,35)
(7,4)-(7,29)
(7,4)-(7,29)
(7,5)-(7,20)
(7,6)-(7,11)
(7,30)-(7,31)
(7,37)-(7,69)
(7,38)-(7,63)
(7,38)-(7,63)
(7,39)-(7,54)
(7,40)-(7,45)
(7,64)-(7,65)
*)
