
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let carry = match a with | (x,y) -> x in carry in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

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
(16,16)-(16,62)
(16,57)-(16,62)
(17,4)-(19,51)
(17,15)-(17,22)
(17,16)-(17,17)
(18,4)-(19,51)
(18,15)-(18,23)
(18,15)-(18,44)
(18,24)-(18,44)
(18,25)-(18,37)
(18,38)-(18,40)
(18,41)-(18,43)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(16,4)-(19,51)
(16,10)-(16,62)
(16,12)-(16,62)
(16,16)-(16,62)
(16,16)-(16,62)
(16,28)-(16,53)
(16,28)-(16,53)
(16,34)-(16,35)
(16,52)-(16,53)
(16,57)-(16,62)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)

(* all spans
(2,6)-(2,15)
(2,10)-(2,15)
(2,10)-(2,11)
(2,14)-(2,15)
(4,14)-(4,65)
(4,16)-(4,65)
(4,20)-(4,65)
(4,23)-(4,29)
(4,23)-(4,24)
(4,28)-(4,29)
(4,35)-(4,37)
(4,43)-(4,65)
(4,43)-(4,44)
(4,48)-(4,65)
(4,49)-(4,54)
(4,55)-(4,56)
(4,57)-(4,64)
(4,58)-(4,59)
(4,62)-(4,63)
(6,12)-(9,67)
(6,15)-(9,67)
(7,2)-(9,67)
(7,5)-(7,40)
(7,5)-(7,21)
(7,6)-(7,17)
(7,18)-(7,20)
(7,24)-(7,40)
(7,25)-(7,36)
(7,37)-(7,39)
(8,7)-(8,67)
(8,8)-(8,62)
(8,57)-(8,58)
(8,9)-(8,56)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,55)
(8,19)-(8,35)
(8,20)-(8,31)
(8,32)-(8,34)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(8,59)-(8,61)
(8,64)-(8,66)
(9,7)-(9,67)
(9,8)-(9,10)
(9,12)-(9,66)
(9,61)-(9,62)
(9,13)-(9,60)
(9,14)-(9,19)
(9,20)-(9,21)
(9,22)-(9,59)
(9,23)-(9,39)
(9,24)-(9,35)
(9,36)-(9,38)
(9,42)-(9,58)
(9,43)-(9,54)
(9,55)-(9,57)
(9,63)-(9,65)
(11,19)-(12,69)
(12,2)-(12,69)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,69)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,69)
(14,11)-(20,34)
(14,14)-(20,34)
(15,2)-(20,34)
(15,11)-(19,51)
(16,4)-(19,51)
(16,10)-(16,62)
(16,12)-(16,62)
(16,16)-(16,62)
(16,28)-(16,53)
(16,34)-(16,35)
(16,52)-(16,53)
(16,57)-(16,62)
(17,4)-(19,51)
(17,15)-(17,22)
(17,16)-(17,17)
(17,19)-(17,21)
(18,4)-(19,51)
(18,15)-(18,44)
(18,15)-(18,23)
(18,24)-(18,44)
(18,25)-(18,37)
(18,38)-(18,40)
(18,41)-(18,43)
(19,4)-(19,51)
(19,18)-(19,44)
(19,18)-(19,32)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,34)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)
