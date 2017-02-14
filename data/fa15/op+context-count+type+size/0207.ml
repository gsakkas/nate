
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (p,q) = a in (((num1 + num2) / 10), ((num1 + num2) mod 10)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(15,68)
(15,27)-(15,31)
(15,42)-(15,44)
(15,49)-(15,53)
(15,49)-(15,68)
(15,66)-(15,68)
(16,5)-(18,52)
(16,17)-(16,21)
(16,20)-(16,21)
(17,5)-(18,52)
(17,16)-(17,34)
(18,5)-(18,52)
(19,15)-(19,18)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(9,3)-(9,75)
(9,3)-(9,75)
(9,51)-(9,61)
(9,51)-(9,63)
(9,62)-(9,63)
(12,3)-(19,33)
(12,12)-(18,52)
(13,5)-(18,52)
(13,5)-(18,52)
(13,11)-(15,68)
(13,13)-(15,68)
(14,7)-(15,68)
(15,7)-(15,68)
(15,27)-(15,68)
(15,49)-(15,68)
(16,5)-(18,52)
(17,5)-(18,52)
(18,5)-(18,52)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,49)-(18,52)
(19,3)-(19,13)
(19,3)-(19,33)
(19,15)-(19,18)
(19,15)-(19,33)
*)