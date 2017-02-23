
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t ->
          let (j,k) = h in
          if (j + k) > 10 then (1, ((j + k) - 10)) else (0, (j + k)) in
    let base = (0, 0) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(20,68)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(20,68)
(19,22)-(19,23)
(20,14)-(20,15)
(20,18)-(20,19)
(20,23)-(20,25)
(20,35)-(20,49)
(20,37)-(20,38)
(20,41)-(20,42)
(20,46)-(20,48)
(20,56)-(20,68)
(20,60)-(20,67)
(20,61)-(20,62)
(20,65)-(20,66)
(21,4)-(23,51)
(21,19)-(21,20)
(22,15)-(22,27)
(22,15)-(22,55)
(22,38)-(22,40)
(22,42)-(22,55)
(22,43)-(22,51)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)

(* type error slice
(15,4)-(23,51)
(15,10)-(20,68)
(16,6)-(20,68)
(16,6)-(20,68)
(16,6)-(20,68)
(16,6)-(20,68)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(20,68)
(20,10)-(20,68)
(20,31)-(20,50)
(21,4)-(23,51)
(21,15)-(21,21)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
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
(4,12)-(8,57)
(4,15)-(8,57)
(5,2)-(8,57)
(5,15)-(5,50)
(5,15)-(5,31)
(5,16)-(5,27)
(5,28)-(5,30)
(5,34)-(5,50)
(5,35)-(5,46)
(5,47)-(5,49)
(6,2)-(8,57)
(6,5)-(6,15)
(6,5)-(6,11)
(6,14)-(6,15)
(7,7)-(7,51)
(7,17)-(7,31)
(7,17)-(7,22)
(7,23)-(7,24)
(7,25)-(7,31)
(7,35)-(7,51)
(7,36)-(7,38)
(7,40)-(7,50)
(7,45)-(7,46)
(7,41)-(7,44)
(7,47)-(7,49)
(8,7)-(8,57)
(8,18)-(8,36)
(8,18)-(8,23)
(8,24)-(8,25)
(8,26)-(8,36)
(8,29)-(8,35)
(8,40)-(8,56)
(8,41)-(8,51)
(8,46)-(8,47)
(8,42)-(8,45)
(8,48)-(8,50)
(8,53)-(8,55)
(10,19)-(11,75)
(11,2)-(11,75)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,75)
(11,39)-(11,45)
(11,39)-(11,40)
(11,44)-(11,45)
(11,51)-(11,63)
(11,51)-(11,61)
(11,62)-(11,63)
(11,69)-(11,75)
(11,69)-(11,70)
(11,74)-(11,75)
(13,11)-(24,34)
(13,14)-(24,34)
(14,2)-(24,34)
(14,11)-(23,51)
(15,4)-(23,51)
(15,10)-(20,68)
(15,12)-(20,68)
(16,6)-(20,68)
(16,12)-(16,13)
(17,14)-(17,16)
(19,10)-(20,68)
(19,22)-(19,23)
(20,10)-(20,68)
(20,13)-(20,25)
(20,13)-(20,20)
(20,14)-(20,15)
(20,18)-(20,19)
(20,23)-(20,25)
(20,31)-(20,50)
(20,32)-(20,33)
(20,35)-(20,49)
(20,36)-(20,43)
(20,37)-(20,38)
(20,41)-(20,42)
(20,46)-(20,48)
(20,56)-(20,68)
(20,57)-(20,58)
(20,60)-(20,67)
(20,61)-(20,62)
(20,65)-(20,66)
(21,4)-(23,51)
(21,15)-(21,21)
(21,16)-(21,17)
(21,19)-(21,20)
(22,4)-(23,51)
(22,15)-(22,55)
(22,15)-(22,27)
(22,28)-(22,41)
(22,29)-(22,37)
(22,38)-(22,40)
(22,42)-(22,55)
(22,43)-(22,51)
(22,52)-(22,54)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
