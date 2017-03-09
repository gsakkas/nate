
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  List.append
    ((clone 0 (lenl1 - lenl2) l1),
      (List.append (clone 0 (lenl1 - lenl2)) l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  ((List.append (clone 0 (lenl1 - lenl2)) l1),
    (List.append (clone 0 (lenl1 - lenl2)) l2));;

*)

(* changed spans
(7,2)-(7,13)
(7,2)-(9,49)
(8,5)-(8,33)
(8,6)-(8,11)
*)

(* type error slice
(2,43)-(2,66)
(2,47)-(2,48)
(2,49)-(2,66)
(2,50)-(2,55)
(8,5)-(8,33)
(8,6)-(8,11)
(9,6)-(9,48)
(9,7)-(9,18)
(9,19)-(9,44)
(9,20)-(9,25)
*)

(* all spans
(2,14)-(2,66)
(2,16)-(2,66)
(2,20)-(2,66)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,66)
(2,47)-(2,48)
(2,43)-(2,46)
(2,44)-(2,45)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(2,58)-(2,65)
(2,59)-(2,60)
(2,63)-(2,64)
(4,12)-(9,49)
(4,15)-(9,49)
(5,2)-(9,49)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(9,49)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(9,49)
(7,2)-(7,13)
(8,4)-(9,49)
(8,5)-(8,33)
(8,6)-(8,11)
(8,12)-(8,13)
(8,14)-(8,29)
(8,15)-(8,20)
(8,23)-(8,28)
(8,30)-(8,32)
(9,6)-(9,48)
(9,7)-(9,18)
(9,19)-(9,44)
(9,20)-(9,25)
(9,26)-(9,27)
(9,28)-(9,43)
(9,29)-(9,34)
(9,37)-(9,42)
(9,45)-(9,47)
*)