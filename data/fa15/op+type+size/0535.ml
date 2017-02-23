
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n >= 0
  then (l1, ((clone 0 n) @ l2))
  else (((clone 0 (n * (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accum) = a in
      let (x1,x2) = x in
      let n = (carry + x1) + x2 in ((n / 10), ((n mod 10) :: accum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then l else bigAdd l ((mulByDigit i) - (1 l));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n >= 0
  then (l1, ((clone 0 n) @ l2))
  else (((clone 0 (n * (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accum) = a in
      let (x1,x2) = x in
      let n = (carry + x1) + x2 in ((n / 10), ((n mod 10) :: accum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 0 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(25,32)-(25,56)
(25,33)-(25,47)
(25,45)-(25,46)
(25,50)-(25,55)
*)

(* type error slice
(4,3)-(8,42)
(4,12)-(8,40)
(4,15)-(8,40)
(7,12)-(7,30)
(7,25)-(7,26)
(7,27)-(7,29)
(13,3)-(22,36)
(13,11)-(22,34)
(13,14)-(22,34)
(22,18)-(22,33)
(22,19)-(22,26)
(22,30)-(22,32)
(24,3)-(25,58)
(24,19)-(25,56)
(24,21)-(25,56)
(25,23)-(25,29)
(25,23)-(25,56)
(25,32)-(25,56)
(25,32)-(25,56)
(25,33)-(25,47)
(25,34)-(25,44)
(25,50)-(25,55)
(25,51)-(25,52)
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
(4,12)-(8,40)
(4,15)-(8,40)
(5,2)-(8,40)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(8,40)
(6,5)-(6,11)
(6,5)-(6,6)
(6,10)-(6,11)
(7,7)-(7,31)
(7,8)-(7,10)
(7,12)-(7,30)
(7,25)-(7,26)
(7,13)-(7,24)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,23)
(7,27)-(7,29)
(8,7)-(8,40)
(8,8)-(8,35)
(8,30)-(8,31)
(8,9)-(8,29)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,28)
(8,19)-(8,20)
(8,23)-(8,27)
(8,32)-(8,34)
(8,37)-(8,39)
(10,19)-(11,68)
(11,2)-(11,68)
(11,8)-(11,9)
(11,23)-(11,24)
(11,35)-(11,68)
(11,38)-(11,43)
(11,38)-(11,39)
(11,42)-(11,43)
(11,49)-(11,61)
(11,49)-(11,59)
(11,60)-(11,61)
(11,67)-(11,68)
(13,11)-(22,34)
(13,14)-(22,34)
(14,2)-(22,34)
(14,11)-(21,51)
(15,4)-(21,51)
(15,10)-(18,68)
(15,12)-(18,68)
(16,6)-(18,68)
(16,26)-(16,27)
(17,6)-(18,68)
(17,20)-(17,21)
(18,6)-(18,68)
(18,14)-(18,31)
(18,14)-(18,26)
(18,15)-(18,20)
(18,23)-(18,25)
(18,29)-(18,31)
(18,35)-(18,68)
(18,36)-(18,44)
(18,37)-(18,38)
(18,41)-(18,43)
(18,46)-(18,67)
(18,47)-(18,57)
(18,48)-(18,49)
(18,54)-(18,56)
(18,61)-(18,66)
(19,4)-(21,51)
(19,15)-(19,22)
(19,16)-(19,17)
(19,19)-(19,21)
(20,4)-(21,51)
(20,15)-(20,58)
(20,15)-(20,23)
(20,24)-(20,58)
(20,25)-(20,37)
(20,38)-(20,47)
(20,39)-(20,40)
(20,44)-(20,46)
(20,48)-(20,57)
(20,49)-(20,50)
(20,54)-(20,56)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
(24,19)-(25,56)
(24,21)-(25,56)
(25,2)-(25,56)
(25,5)-(25,10)
(25,5)-(25,6)
(25,9)-(25,10)
(25,16)-(25,17)
(25,23)-(25,56)
(25,23)-(25,29)
(25,30)-(25,31)
(25,32)-(25,56)
(25,33)-(25,47)
(25,34)-(25,44)
(25,45)-(25,46)
(25,50)-(25,55)
(25,51)-(25,52)
(25,53)-(25,54)
*)
