
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (b::b',c::c') = x in [((b + c), (b + c))] @ a in
    let base = (0, 0) in
    let args = padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,45)-(3,48)
(3,45)-(3,68)
(3,49)-(3,50)
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(20,7)-(20,66)
(23,2)-(28,34)
(24,4)-(27,51)
(24,16)-(24,65)
(24,41)-(24,61)
(24,41)-(24,65)
(24,43)-(24,50)
(24,44)-(24,45)
(24,48)-(24,49)
(24,53)-(24,54)
(24,57)-(24,58)
(24,62)-(24,63)
(24,64)-(24,65)
(25,4)-(27,51)
(25,15)-(25,21)
(25,16)-(25,17)
(25,19)-(25,20)
(26,4)-(27,51)
(26,15)-(26,22)
(26,15)-(26,28)
(27,4)-(27,51)
(28,2)-(28,12)
*)

(* type error slice
(24,4)-(27,51)
(24,10)-(24,65)
(24,41)-(24,65)
(24,62)-(24,63)
(24,64)-(24,65)
(25,4)-(27,51)
(25,15)-(25,21)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,35)-(27,39)
*)

(* all spans
(2,14)-(3,69)
(2,16)-(3,69)
(3,2)-(3,69)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,69)
(3,31)-(3,32)
(3,45)-(3,68)
(3,49)-(3,50)
(3,45)-(3,48)
(3,46)-(3,47)
(3,51)-(3,68)
(3,52)-(3,57)
(3,58)-(3,59)
(3,60)-(3,67)
(3,61)-(3,62)
(3,65)-(3,66)
(5,6)-(5,11)
(5,10)-(5,11)
(7,12)-(15,41)
(7,15)-(15,41)
(8,2)-(15,41)
(8,11)-(8,25)
(8,11)-(8,22)
(8,23)-(8,25)
(9,2)-(15,41)
(9,11)-(9,25)
(9,11)-(9,22)
(9,23)-(9,25)
(10,2)-(15,41)
(10,5)-(10,12)
(10,5)-(10,7)
(10,10)-(10,12)
(11,7)-(11,15)
(11,8)-(11,10)
(11,12)-(11,14)
(13,4)-(15,41)
(13,7)-(13,14)
(13,7)-(13,9)
(13,12)-(13,14)
(14,9)-(14,41)
(14,10)-(14,12)
(14,14)-(14,40)
(14,35)-(14,36)
(14,15)-(14,34)
(14,16)-(14,21)
(14,22)-(14,23)
(14,24)-(14,33)
(14,25)-(14,27)
(14,30)-(14,32)
(14,37)-(14,39)
(15,9)-(15,41)
(15,10)-(15,36)
(15,31)-(15,32)
(15,11)-(15,30)
(15,12)-(15,17)
(15,18)-(15,19)
(15,20)-(15,29)
(15,21)-(15,23)
(15,26)-(15,28)
(15,33)-(15,35)
(15,38)-(15,40)
(17,19)-(20,66)
(18,2)-(20,66)
(18,5)-(18,11)
(18,5)-(18,6)
(18,9)-(18,11)
(19,7)-(19,9)
(20,7)-(20,66)
(20,19)-(20,20)
(20,24)-(20,65)
(20,30)-(20,31)
(20,44)-(20,56)
(20,44)-(20,54)
(20,55)-(20,56)
(20,64)-(20,65)
(22,11)-(28,34)
(22,14)-(28,34)
(23,2)-(28,34)
(23,11)-(27,51)
(24,4)-(27,51)
(24,10)-(24,65)
(24,12)-(24,65)
(24,16)-(24,65)
(24,36)-(24,37)
(24,41)-(24,65)
(24,62)-(24,63)
(24,41)-(24,61)
(24,42)-(24,60)
(24,43)-(24,50)
(24,44)-(24,45)
(24,48)-(24,49)
(24,52)-(24,59)
(24,53)-(24,54)
(24,57)-(24,58)
(24,64)-(24,65)
(25,4)-(27,51)
(25,15)-(25,21)
(25,16)-(25,17)
(25,19)-(25,20)
(26,4)-(27,51)
(26,15)-(26,28)
(26,15)-(26,22)
(26,23)-(26,25)
(26,26)-(26,28)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)
