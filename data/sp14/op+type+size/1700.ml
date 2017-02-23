
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      match x with
      | (x1,x2)::t ->
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in [(tens, ones)] :: a
      | [] -> a in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(25,15)
(20,20)-(20,21)
(21,6)-(25,15)
(23,10)-(24,67)
(23,21)-(23,42)
(23,34)-(23,36)
(24,10)-(24,67)
(24,34)-(24,36)
(24,48)-(24,62)
(24,48)-(24,67)
(24,50)-(24,54)
(24,56)-(24,60)
(24,66)-(24,67)
(25,14)-(25,15)
(26,4)-(28,51)
(26,15)-(26,23)
(26,16)-(26,22)
(26,17)-(26,18)
(26,20)-(26,21)
(27,4)-(28,51)
(27,15)-(27,44)
(28,4)-(28,51)
*)

(* type error slice
(19,4)-(28,51)
(19,10)-(25,15)
(19,12)-(25,15)
(20,6)-(25,15)
(20,6)-(25,15)
(20,20)-(20,21)
(21,6)-(25,15)
(21,6)-(25,15)
(23,10)-(24,67)
(24,10)-(24,67)
(24,48)-(24,67)
(24,48)-(24,67)
(24,66)-(24,67)
(25,14)-(25,15)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
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
(4,12)-(9,39)
(4,15)-(9,39)
(5,2)-(9,39)
(5,11)-(5,25)
(5,11)-(5,22)
(5,23)-(5,25)
(6,2)-(9,39)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(9,39)
(7,5)-(7,12)
(7,5)-(7,7)
(7,10)-(7,12)
(8,7)-(8,39)
(8,8)-(8,34)
(8,29)-(8,30)
(8,9)-(8,28)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,27)
(8,19)-(8,21)
(8,24)-(8,26)
(8,31)-(8,33)
(8,36)-(8,38)
(9,7)-(9,39)
(9,8)-(9,10)
(9,12)-(9,38)
(9,33)-(9,34)
(9,13)-(9,32)
(9,14)-(9,19)
(9,20)-(9,21)
(9,22)-(9,31)
(9,23)-(9,25)
(9,28)-(9,30)
(9,35)-(9,37)
(11,19)-(15,46)
(12,2)-(15,46)
(12,8)-(12,9)
(13,10)-(13,12)
(14,13)-(14,37)
(14,16)-(14,22)
(14,16)-(14,17)
(14,21)-(14,22)
(14,28)-(14,29)
(14,35)-(14,37)
(15,12)-(15,46)
(15,15)-(15,21)
(15,15)-(15,16)
(15,20)-(15,21)
(15,27)-(15,28)
(15,34)-(15,46)
(15,34)-(15,44)
(15,45)-(15,46)
(17,11)-(29,34)
(17,14)-(29,34)
(18,2)-(29,34)
(18,11)-(28,51)
(19,4)-(28,51)
(19,10)-(25,15)
(19,12)-(25,15)
(20,6)-(25,15)
(20,20)-(20,21)
(21,6)-(25,15)
(21,12)-(21,13)
(23,10)-(24,67)
(23,21)-(23,42)
(23,21)-(23,30)
(23,22)-(23,24)
(23,27)-(23,29)
(23,33)-(23,42)
(23,34)-(23,36)
(23,39)-(23,41)
(24,10)-(24,67)
(24,21)-(24,44)
(24,21)-(24,30)
(24,22)-(24,24)
(24,27)-(24,29)
(24,33)-(24,44)
(24,34)-(24,36)
(24,41)-(24,43)
(24,48)-(24,67)
(24,48)-(24,62)
(24,49)-(24,61)
(24,50)-(24,54)
(24,56)-(24,60)
(24,66)-(24,67)
(25,14)-(25,15)
(26,4)-(28,51)
(26,15)-(26,23)
(26,16)-(26,22)
(26,17)-(26,18)
(26,20)-(26,21)
(27,4)-(28,51)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
(28,4)-(28,51)
(28,18)-(28,44)
(28,18)-(28,32)
(28,33)-(28,34)
(28,35)-(28,39)
(28,40)-(28,44)
(28,48)-(28,51)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)
