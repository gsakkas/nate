
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, (x :: a)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (carry,num) = a in let (l1,l2) = x in (0, (l1 :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,16)-(13,29)
(13,21)-(13,22)
(13,26)-(13,27)
(14,4)-(16,51)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)

(* type error slice
(13,4)-(16,51)
(13,10)-(13,29)
(13,12)-(13,29)
(13,16)-(13,29)
(13,20)-(13,28)
(13,26)-(13,27)
(16,18)-(16,32)
(16,18)-(16,44)
(16,33)-(16,34)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(6,52)
(6,3)-(6,24)
(6,19)-(6,20)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,13)-(6,17)
(6,21)-(6,23)
(6,26)-(6,51)
(6,46)-(6,47)
(6,27)-(6,45)
(6,28)-(6,33)
(6,34)-(6,35)
(6,36)-(6,44)
(6,39)-(6,43)
(6,48)-(6,50)
(8,19)-(9,68)
(9,2)-(9,68)
(9,8)-(9,9)
(9,23)-(9,24)
(9,35)-(9,68)
(9,38)-(9,43)
(9,38)-(9,39)
(9,42)-(9,43)
(9,49)-(9,61)
(9,49)-(9,59)
(9,60)-(9,61)
(9,67)-(9,68)
(11,11)-(17,34)
(11,14)-(17,34)
(12,2)-(17,34)
(12,11)-(16,51)
(13,4)-(16,51)
(13,10)-(13,29)
(13,12)-(13,29)
(13,16)-(13,29)
(13,17)-(13,18)
(13,20)-(13,28)
(13,21)-(13,22)
(13,26)-(13,27)
(14,4)-(16,51)
(14,15)-(14,22)
(14,16)-(14,17)
(14,19)-(14,21)
(15,4)-(16,51)
(15,15)-(15,33)
(15,15)-(15,27)
(15,28)-(15,30)
(15,31)-(15,33)
(16,4)-(16,51)
(16,18)-(16,44)
(16,18)-(16,32)
(16,33)-(16,34)
(16,35)-(16,39)
(16,40)-(16,44)
(16,48)-(16,51)
(17,2)-(17,34)
(17,2)-(17,12)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)
