
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
      if let (y,z) = x in (y + z) > 9
      then let (y,z) = x in [(y + z) / 10] @ a
      else (let (y,z) = x in [y + z] @ a) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

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
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,10)-(15,38)
(15,22)-(15,23)
(15,28)-(15,29)
(15,37)-(15,38)
(16,12)-(16,47)
(16,24)-(16,25)
(16,31)-(16,32)
(16,31)-(16,42)
(16,40)-(16,42)
(16,46)-(16,47)
(17,13)-(17,41)
(17,25)-(17,26)
(17,31)-(17,32)
(17,40)-(17,41)
(18,5)-(20,52)
(18,17)-(18,22)
(19,5)-(20,52)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
(20,49)-(20,52)
(21,3)-(21,13)
(21,3)-(21,33)
(21,15)-(21,18)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(14,5)-(20,52)
(14,11)-(17,41)
(16,29)-(16,47)
(16,44)-(16,45)
(16,46)-(16,47)
(18,5)-(20,52)
(18,17)-(18,22)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
*)
