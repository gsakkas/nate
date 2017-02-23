
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((o,sum),[]) -> (0, sum)
      | ((o,sum),(b,c)::l') ->
          let d = (b + c) + o in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(19,68)
(15,12)-(15,18)
(15,13)-(15,14)
(16,24)-(16,32)
(16,25)-(16,26)
(16,28)-(16,31)
(18,10)-(19,68)
(18,18)-(18,29)
(18,19)-(18,20)
(18,23)-(18,24)
(18,28)-(18,29)
(19,10)-(19,68)
(19,13)-(19,14)
(19,13)-(19,19)
(19,17)-(19,19)
(19,25)-(19,40)
(19,26)-(19,27)
(19,29)-(19,39)
(19,30)-(19,31)
(19,35)-(19,38)
(19,46)-(19,68)
(19,47)-(19,48)
(19,51)-(19,59)
(19,52)-(19,53)
(19,56)-(19,58)
(19,63)-(19,66)
(20,4)-(22,51)
(20,15)-(20,22)
(21,4)-(22,51)
(22,4)-(22,51)
*)

(* type error slice
(14,4)-(22,51)
(14,10)-(19,68)
(14,12)-(19,68)
(15,6)-(19,68)
(15,6)-(19,68)
(15,12)-(15,18)
(15,16)-(15,17)
(21,4)-(22,51)
(21,15)-(21,23)
(21,15)-(21,44)
(21,24)-(21,44)
(21,25)-(21,37)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
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
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
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
(7,7)-(7,67)
(7,8)-(7,62)
(7,57)-(7,58)
(7,9)-(7,56)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,55)
(7,19)-(7,35)
(7,20)-(7,31)
(7,32)-(7,34)
(7,38)-(7,54)
(7,39)-(7,50)
(7,51)-(7,53)
(7,59)-(7,61)
(7,64)-(7,66)
(9,19)-(10,74)
(10,2)-(10,74)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,74)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,74)
(10,68)-(10,69)
(10,73)-(10,74)
(12,11)-(23,34)
(12,14)-(23,34)
(13,2)-(23,34)
(13,11)-(22,51)
(14,4)-(22,51)
(14,10)-(19,68)
(14,12)-(19,68)
(15,6)-(19,68)
(15,12)-(15,18)
(15,13)-(15,14)
(15,16)-(15,17)
(16,24)-(16,32)
(16,25)-(16,26)
(16,28)-(16,31)
(18,10)-(19,68)
(18,18)-(18,29)
(18,18)-(18,25)
(18,19)-(18,20)
(18,23)-(18,24)
(18,28)-(18,29)
(19,10)-(19,68)
(19,13)-(19,19)
(19,13)-(19,14)
(19,17)-(19,19)
(19,25)-(19,40)
(19,26)-(19,27)
(19,29)-(19,39)
(19,30)-(19,31)
(19,35)-(19,38)
(19,46)-(19,68)
(19,47)-(19,48)
(19,50)-(19,67)
(19,51)-(19,59)
(19,52)-(19,53)
(19,56)-(19,58)
(19,63)-(19,66)
(20,4)-(22,51)
(20,15)-(20,22)
(20,16)-(20,17)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,44)
(21,15)-(21,23)
(21,24)-(21,44)
(21,25)-(21,37)
(21,38)-(21,40)
(21,41)-(21,43)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)
