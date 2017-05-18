
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (bottom_mult,total) = a in
    match bottom_mult with
    | [] -> total
    | h::t ->
        let newTotal = mulByDigit h x in
        let updateTotal = bigAdd newTotal total in (t, updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (upper_mult,total) = a in
    let newTotal = mulByDigit x upper_mult in
    let updateTotal = bigAdd newTotal total in
    ((upper_mult @ [0]), updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(47,4)-(52,67)
(48,4)-(52,67)
(48,10)-(48,21)
(49,12)-(49,17)
(51,34)-(51,35)
(52,8)-(52,67)
(52,52)-(52,53)
(52,55)-(52,66)
*)

(* type error slice
(4,3)-(14,19)
(4,12)-(14,17)
(4,15)-(14,17)
(8,35)-(8,48)
(8,43)-(8,44)
(8,45)-(8,47)
(19,3)-(31,47)
(19,11)-(31,45)
(19,14)-(31,45)
(31,28)-(31,43)
(31,29)-(31,36)
(31,40)-(31,42)
(46,2)-(54,66)
(46,8)-(52,67)
(46,10)-(52,67)
(47,4)-(52,67)
(47,4)-(52,67)
(47,30)-(47,31)
(48,4)-(52,67)
(48,4)-(52,67)
(49,12)-(49,17)
(51,8)-(52,67)
(52,8)-(52,67)
(52,26)-(52,32)
(52,26)-(52,47)
(52,42)-(52,47)
(52,51)-(52,67)
(54,33)-(54,47)
(54,33)-(54,59)
(54,48)-(54,49)
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
(4,12)-(14,17)
(4,15)-(14,17)
(5,2)-(14,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(7,4)-(8,49)
(7,12)-(7,47)
(7,12)-(7,28)
(7,13)-(7,24)
(7,25)-(7,27)
(7,31)-(7,47)
(7,32)-(7,43)
(7,44)-(7,46)
(8,4)-(8,49)
(8,17)-(8,26)
(8,17)-(8,22)
(8,23)-(8,24)
(8,25)-(8,26)
(8,30)-(8,49)
(8,31)-(8,33)
(8,35)-(8,48)
(8,43)-(8,44)
(8,36)-(8,42)
(8,45)-(8,47)
(10,4)-(14,17)
(10,7)-(10,42)
(10,7)-(10,23)
(10,8)-(10,19)
(10,20)-(10,22)
(10,26)-(10,42)
(10,27)-(10,38)
(10,39)-(10,41)
(12,6)-(13,53)
(12,15)-(12,50)
(12,15)-(12,31)
(12,16)-(12,27)
(12,28)-(12,30)
(12,34)-(12,50)
(12,35)-(12,46)
(12,47)-(12,49)
(13,7)-(13,52)
(13,20)-(13,29)
(13,20)-(13,25)
(13,26)-(13,27)
(13,28)-(13,29)
(13,33)-(13,52)
(13,34)-(13,47)
(13,42)-(13,43)
(13,35)-(13,41)
(13,44)-(13,46)
(13,49)-(13,51)
(14,9)-(14,17)
(14,10)-(14,12)
(14,14)-(14,16)
(16,19)-(17,70)
(17,2)-(17,70)
(17,8)-(17,9)
(17,23)-(17,25)
(17,36)-(17,70)
(17,39)-(17,45)
(17,39)-(17,40)
(17,44)-(17,45)
(17,51)-(17,63)
(17,51)-(17,61)
(17,62)-(17,63)
(17,69)-(17,70)
(19,11)-(31,45)
(19,14)-(31,45)
(20,2)-(31,45)
(20,11)-(30,51)
(21,4)-(30,51)
(21,10)-(27,35)
(21,12)-(27,35)
(22,6)-(27,35)
(22,26)-(22,27)
(23,6)-(27,35)
(23,24)-(23,25)
(24,6)-(27,35)
(24,20)-(24,41)
(24,20)-(24,33)
(24,21)-(24,25)
(24,28)-(24,32)
(24,36)-(24,41)
(25,6)-(27,35)
(25,9)-(25,20)
(25,9)-(25,16)
(25,19)-(25,20)
(26,11)-(26,42)
(26,12)-(26,13)
(26,15)-(26,41)
(26,22)-(26,23)
(26,16)-(26,21)
(26,24)-(26,40)
(26,25)-(26,39)
(26,25)-(26,32)
(26,37)-(26,39)
(27,11)-(27,35)
(27,12)-(27,13)
(27,15)-(27,34)
(27,22)-(27,23)
(27,16)-(27,21)
(27,24)-(27,33)
(27,25)-(27,32)
(28,4)-(30,51)
(28,15)-(28,22)
(28,16)-(28,17)
(28,19)-(28,21)
(29,4)-(30,51)
(29,15)-(29,57)
(29,47)-(29,48)
(29,15)-(29,46)
(29,16)-(29,24)
(29,25)-(29,45)
(29,26)-(29,38)
(29,39)-(29,41)
(29,42)-(29,44)
(29,49)-(29,57)
(29,50)-(29,56)
(29,51)-(29,52)
(29,54)-(29,55)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,45)
(31,2)-(31,12)
(31,13)-(31,45)
(31,14)-(31,22)
(31,23)-(31,44)
(31,24)-(31,27)
(31,28)-(31,43)
(31,29)-(31,36)
(31,37)-(31,39)
(31,40)-(31,42)
(33,15)-(43,29)
(33,17)-(43,29)
(34,2)-(43,29)
(34,16)-(42,70)
(34,18)-(42,70)
(34,20)-(42,70)
(34,26)-(42,70)
(35,4)-(42,70)
(35,19)-(35,29)
(35,19)-(35,27)
(35,28)-(35,29)
(36,4)-(42,70)
(36,10)-(36,18)
(37,12)-(37,29)
(37,20)-(37,21)
(37,12)-(37,19)
(37,13)-(37,18)
(37,22)-(37,29)
(39,8)-(42,70)
(39,22)-(39,37)
(39,22)-(39,29)
(39,23)-(39,24)
(39,27)-(39,28)
(39,32)-(39,37)
(40,8)-(42,70)
(40,22)-(40,36)
(40,22)-(40,29)
(40,34)-(40,36)
(41,8)-(42,70)
(41,23)-(41,47)
(41,23)-(41,42)
(41,24)-(41,31)
(41,34)-(41,41)
(41,45)-(41,47)
(42,8)-(42,70)
(42,16)-(42,26)
(42,16)-(42,24)
(42,25)-(42,26)
(42,30)-(42,70)
(42,61)-(42,62)
(42,30)-(42,60)
(42,31)-(42,36)
(42,37)-(42,38)
(42,39)-(42,40)
(42,41)-(42,49)
(42,50)-(42,59)
(42,51)-(42,58)
(42,63)-(42,70)
(43,2)-(43,29)
(43,2)-(43,12)
(43,13)-(43,29)
(43,14)-(43,19)
(43,20)-(43,21)
(43,22)-(43,23)
(43,24)-(43,25)
(43,26)-(43,28)
(45,11)-(54,66)
(45,14)-(54,66)
(46,2)-(54,66)
(46,8)-(52,67)
(46,10)-(52,67)
(47,4)-(52,67)
(47,30)-(47,31)
(48,4)-(52,67)
(48,10)-(48,21)
(49,12)-(49,17)
(51,8)-(52,67)
(51,23)-(51,37)
(51,23)-(51,33)
(51,34)-(51,35)
(51,36)-(51,37)
(52,8)-(52,67)
(52,26)-(52,47)
(52,26)-(52,32)
(52,33)-(52,41)
(52,42)-(52,47)
(52,51)-(52,67)
(52,52)-(52,53)
(52,55)-(52,66)
(53,2)-(54,66)
(53,13)-(53,21)
(53,14)-(53,16)
(53,18)-(53,20)
(54,2)-(54,66)
(54,13)-(54,15)
(54,19)-(54,66)
(54,33)-(54,59)
(54,33)-(54,47)
(54,48)-(54,49)
(54,50)-(54,54)
(54,55)-(54,59)
(54,63)-(54,66)
*)