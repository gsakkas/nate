
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let sum = l1x + l2x in
      let a1 (0::[]) = (a1 [0]) + (sum / 10) in
      ((0 :: a2), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let sum = l1x + l2x in (((sum mod 10) :: a2), ((sum / 10) :: a1)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,6)-(24,39)
EMPTY
EmptyG

(23,14)-(23,44)
EMPTY
EmptyG

(23,23)-(23,31)
EMPTY
EmptyG

(23,23)-(23,44)
EMPTY
EmptyG

(23,24)-(23,26)
EMPTY
EmptyG

(23,27)-(23,30)
EMPTY
EmptyG

(23,28)-(23,29)
EMPTY
EmptyG

(23,34)-(23,44)
EMPTY
EmptyG

(23,35)-(23,38)
EMPTY
EmptyG

(23,41)-(23,43)
EMPTY
EmptyG

(24,8)-(24,9)
EMPTY
EmptyG

(24,13)-(24,15)
EMPTY
EmptyG

(24,18)-(24,38)
EMPTY
EmptyG

(25,4)-(27,51)
sum / 10
BopG VarG LitG

*)
