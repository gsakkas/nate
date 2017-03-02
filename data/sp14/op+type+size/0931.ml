
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

let rec removeZero l =
  match l with | [] -> l | x::l' -> if x = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sumInit = (x1 + x2) + carry in
      let carry2 = sumInit / 10 in
      let dig = sumInit mod 10 in (carry2, (carry2 :: dig)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

let rec removeZero l =
  match l with | [] -> l | x::l' -> if x = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sumInit = (x1 + x2) + carry in
      let carry2 = sumInit / 10 in
      let dig = sumInit mod 10 in (carry2, [carry2; dig]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,43)-(24,58)
*)

(* type error slice
(24,6)-(24,59)
(24,16)-(24,30)
(24,43)-(24,58)
(24,54)-(24,57)
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
(4,12)-(12,61)
(4,15)-(12,61)
(5,2)-(12,61)
(5,16)-(5,67)
(5,16)-(5,30)
(5,31)-(5,62)
(5,44)-(5,61)
(5,54)-(5,61)
(5,54)-(5,57)
(5,60)-(5,61)
(5,63)-(5,64)
(5,65)-(5,67)
(6,2)-(12,61)
(6,16)-(6,67)
(6,16)-(6,30)
(6,31)-(6,62)
(6,44)-(6,61)
(6,54)-(6,61)
(6,54)-(6,57)
(6,60)-(6,61)
(6,63)-(6,64)
(6,65)-(6,67)
(7,2)-(12,61)
(7,5)-(7,22)
(7,5)-(7,12)
(7,15)-(7,22)
(8,7)-(8,15)
(8,8)-(8,10)
(8,12)-(8,14)
(10,4)-(12,61)
(10,7)-(10,24)
(10,7)-(10,14)
(10,17)-(10,24)
(11,9)-(11,61)
(11,10)-(11,56)
(11,11)-(11,22)
(11,23)-(11,52)
(11,24)-(11,29)
(11,30)-(11,31)
(11,32)-(11,51)
(11,33)-(11,40)
(11,43)-(11,50)
(11,53)-(11,55)
(11,58)-(11,60)
(12,9)-(12,61)
(12,10)-(12,12)
(12,14)-(12,60)
(12,15)-(12,26)
(12,27)-(12,56)
(12,28)-(12,33)
(12,34)-(12,35)
(12,36)-(12,55)
(12,37)-(12,44)
(12,47)-(12,54)
(12,57)-(12,59)
(14,19)-(15,70)
(15,2)-(15,70)
(15,8)-(15,9)
(15,23)-(15,24)
(15,36)-(15,70)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,63)
(15,50)-(15,60)
(15,61)-(15,63)
(15,69)-(15,70)
(17,11)-(28,34)
(17,14)-(28,34)
(18,2)-(28,34)
(18,11)-(27,51)
(19,4)-(27,51)
(19,10)-(24,59)
(19,12)-(24,59)
(20,6)-(24,59)
(20,24)-(20,25)
(21,6)-(24,59)
(21,20)-(21,21)
(22,6)-(24,59)
(22,20)-(22,37)
(22,20)-(22,29)
(22,21)-(22,23)
(22,26)-(22,28)
(22,32)-(22,37)
(23,6)-(24,59)
(23,19)-(23,31)
(23,19)-(23,26)
(23,29)-(23,31)
(24,6)-(24,59)
(24,16)-(24,30)
(24,16)-(24,23)
(24,28)-(24,30)
(24,34)-(24,59)
(24,35)-(24,41)
(24,43)-(24,58)
(24,44)-(24,50)
(24,54)-(24,57)
(25,4)-(27,51)
(25,15)-(25,22)
(25,16)-(25,17)
(25,19)-(25,21)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
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