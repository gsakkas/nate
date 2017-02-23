
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [res; carry] in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in res @ [carry] in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,52)-(23,64)
(23,53)-(23,56)
(23,58)-(23,63)
*)

(* type error slice
(13,2)-(13,74)
(13,2)-(13,74)
(13,39)-(13,40)
(13,39)-(13,44)
(13,39)-(13,44)
(13,43)-(13,44)
(13,50)-(13,60)
(13,50)-(13,62)
(13,61)-(13,62)
(16,2)-(24,34)
(16,11)-(23,64)
(17,4)-(23,64)
(17,4)-(23,64)
(17,10)-(20,73)
(19,6)-(20,73)
(19,24)-(19,25)
(20,8)-(20,27)
(20,21)-(20,26)
(20,35)-(20,72)
(20,68)-(20,71)
(21,4)-(23,64)
(22,4)-(23,64)
(23,4)-(23,64)
(23,4)-(23,64)
(23,22)-(23,36)
(23,22)-(23,48)
(23,37)-(23,38)
(23,52)-(23,64)
(23,52)-(23,64)
(23,52)-(23,64)
(23,53)-(23,56)
(23,58)-(23,63)
(24,2)-(24,12)
(24,2)-(24,34)
(24,13)-(24,34)
(24,14)-(24,17)
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
(4,12)-(10,17)
(4,15)-(10,17)
(5,2)-(10,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,10)
(6,12)-(6,66)
(6,61)-(6,62)
(6,13)-(6,60)
(6,14)-(6,19)
(6,20)-(6,21)
(6,22)-(6,59)
(6,23)-(6,39)
(6,24)-(6,35)
(6,36)-(6,38)
(6,42)-(6,58)
(6,43)-(6,54)
(6,55)-(6,57)
(6,63)-(6,65)
(8,4)-(10,17)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,64)
(9,59)-(9,60)
(9,11)-(9,58)
(9,12)-(9,17)
(9,18)-(9,19)
(9,20)-(9,57)
(9,21)-(9,37)
(9,22)-(9,33)
(9,34)-(9,36)
(9,40)-(9,56)
(9,41)-(9,52)
(9,53)-(9,55)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
(12,19)-(13,74)
(13,2)-(13,74)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,74)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,74)
(13,68)-(13,69)
(13,73)-(13,74)
(15,11)-(24,34)
(15,14)-(24,34)
(16,2)-(24,34)
(16,11)-(23,64)
(17,4)-(23,64)
(17,10)-(20,73)
(17,12)-(20,73)
(18,6)-(20,73)
(18,20)-(18,21)
(19,6)-(20,73)
(19,24)-(19,25)
(20,6)-(20,73)
(20,7)-(20,33)
(20,8)-(20,27)
(20,9)-(20,18)
(20,10)-(20,12)
(20,15)-(20,17)
(20,21)-(20,26)
(20,30)-(20,32)
(20,35)-(20,72)
(20,36)-(20,64)
(20,37)-(20,56)
(20,38)-(20,47)
(20,39)-(20,41)
(20,44)-(20,46)
(20,50)-(20,55)
(20,61)-(20,63)
(20,68)-(20,71)
(21,4)-(23,64)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,64)
(22,15)-(22,44)
(22,15)-(22,23)
(22,24)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
(23,4)-(23,64)
(23,22)-(23,48)
(23,22)-(23,36)
(23,37)-(23,38)
(23,39)-(23,43)
(23,44)-(23,48)
(23,52)-(23,64)
(23,53)-(23,56)
(23,58)-(23,63)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
