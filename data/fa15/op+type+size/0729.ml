
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (bit,l) = a in
    let movedList = List.append l 0 in ((bit + 1), (bigAdd movedList x)) in
  let base = (0, []) in
  let args = List.map (mulByDigit l1) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (ll,accumulate) = a in
    let multed = mulByDigit x l1 in
    let accumulate = List.append accumulate [0] in
    (l1, (bigAdd accumulate multed)) in
  let base = (l1, [0]) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,4)-(34,72)
(34,4)-(34,72)
(34,20)-(34,31)
(34,32)-(34,33)
(34,34)-(34,35)
(34,40)-(34,49)
(34,41)-(34,44)
(34,47)-(34,48)
(34,59)-(34,68)
(34,69)-(34,70)
(35,2)-(37,49)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(37,49)
(36,13)-(36,21)
(36,13)-(36,37)
(36,22)-(36,37)
(36,23)-(36,33)
(37,2)-(37,49)
(37,16)-(37,42)
*)

(* type error slice
(34,20)-(34,31)
(34,20)-(34,35)
(34,34)-(34,35)
(36,2)-(37,49)
(36,13)-(36,21)
(36,13)-(36,37)
(37,16)-(37,30)
(37,16)-(37,42)
(37,38)-(37,42)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(6,76)
(4,15)-(6,76)
(5,2)-(6,76)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(6,76)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(6,16)-(6,40)
(6,17)-(6,19)
(6,21)-(6,39)
(6,34)-(6,35)
(6,22)-(6,33)
(6,23)-(6,28)
(6,29)-(6,30)
(6,31)-(6,32)
(6,36)-(6,38)
(6,46)-(6,76)
(6,47)-(6,71)
(6,66)-(6,67)
(6,48)-(6,65)
(6,49)-(6,54)
(6,55)-(6,56)
(6,57)-(6,64)
(6,58)-(6,59)
(6,62)-(6,63)
(6,68)-(6,70)
(6,73)-(6,75)
(8,19)-(9,74)
(9,2)-(9,74)
(9,8)-(9,9)
(9,23)-(9,25)
(9,36)-(9,74)
(9,39)-(9,44)
(9,39)-(9,40)
(9,43)-(9,44)
(9,50)-(9,62)
(9,50)-(9,60)
(9,61)-(9,62)
(9,68)-(9,74)
(9,68)-(9,69)
(9,73)-(9,74)
(11,11)-(21,34)
(11,14)-(21,34)
(12,2)-(21,34)
(12,11)-(20,39)
(13,4)-(20,39)
(13,10)-(16,77)
(13,12)-(16,77)
(14,6)-(16,77)
(14,28)-(14,29)
(15,6)-(16,77)
(15,20)-(15,21)
(16,6)-(16,77)
(16,7)-(16,33)
(16,8)-(16,27)
(16,9)-(16,18)
(16,10)-(16,12)
(16,15)-(16,17)
(16,21)-(16,26)
(16,30)-(16,32)
(16,35)-(16,76)
(16,36)-(16,64)
(16,37)-(16,56)
(16,38)-(16,47)
(16,39)-(16,41)
(16,44)-(16,46)
(16,50)-(16,55)
(16,61)-(16,63)
(16,68)-(16,75)
(17,4)-(20,39)
(17,15)-(17,22)
(17,16)-(17,17)
(17,19)-(17,21)
(18,4)-(20,39)
(18,15)-(18,44)
(18,15)-(18,23)
(18,24)-(18,44)
(18,25)-(18,37)
(18,38)-(18,40)
(18,41)-(18,43)
(19,4)-(20,39)
(19,22)-(19,48)
(19,22)-(19,36)
(19,37)-(19,38)
(19,39)-(19,43)
(19,44)-(19,48)
(20,4)-(20,39)
(20,7)-(20,16)
(20,7)-(20,12)
(20,15)-(20,16)
(20,22)-(20,30)
(20,22)-(20,23)
(20,27)-(20,30)
(20,36)-(20,39)
(21,2)-(21,34)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
(23,19)-(29,63)
(23,21)-(29,63)
(24,2)-(29,63)
(24,8)-(26,71)
(24,10)-(26,71)
(25,4)-(26,71)
(25,26)-(25,27)
(26,4)-(26,71)
(26,5)-(26,29)
(26,6)-(26,23)
(26,7)-(26,12)
(26,15)-(26,22)
(26,16)-(26,17)
(26,20)-(26,21)
(26,26)-(26,28)
(26,31)-(26,70)
(26,32)-(26,58)
(26,33)-(26,50)
(26,34)-(26,39)
(26,42)-(26,49)
(26,43)-(26,44)
(26,47)-(26,48)
(26,55)-(26,57)
(26,62)-(26,69)
(27,2)-(29,63)
(27,13)-(27,20)
(27,14)-(27,15)
(27,17)-(27,19)
(28,2)-(29,63)
(28,16)-(28,33)
(28,16)-(28,24)
(28,25)-(28,33)
(28,26)-(28,27)
(28,31)-(28,32)
(29,2)-(29,63)
(29,16)-(29,45)
(29,16)-(29,30)
(29,31)-(29,32)
(29,33)-(29,37)
(29,38)-(29,45)
(29,49)-(29,63)
(29,49)-(29,59)
(29,60)-(29,63)
(31,11)-(37,49)
(31,14)-(37,49)
(32,2)-(37,49)
(32,8)-(34,72)
(32,10)-(34,72)
(33,4)-(34,72)
(33,18)-(33,19)
(34,4)-(34,72)
(34,20)-(34,35)
(34,20)-(34,31)
(34,32)-(34,33)
(34,34)-(34,35)
(34,39)-(34,72)
(34,40)-(34,49)
(34,41)-(34,44)
(34,47)-(34,48)
(34,51)-(34,71)
(34,52)-(34,58)
(34,59)-(34,68)
(34,69)-(34,70)
(35,2)-(37,49)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(37,49)
(36,13)-(36,37)
(36,13)-(36,21)
(36,22)-(36,37)
(36,23)-(36,33)
(36,34)-(36,36)
(37,2)-(37,49)
(37,16)-(37,42)
(37,16)-(37,30)
(37,31)-(37,32)
(37,33)-(37,37)
(37,38)-(37,42)
(37,46)-(37,49)
*)
