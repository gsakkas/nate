
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = (0, 0) in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j) -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,17)
let (i , j) = x in
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,21)
EMPTY
EmptyG

(20,4)-(26,51)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(20,19)-(20,20)
[]
ListG EmptyG Nothing

(22,6)-(25,20)
EMPTY
EmptyG

(23,6)-(25,20)
EMPTY
EmptyG

(23,12)-(23,17)
EMPTY
EmptyG

(24,17)-(24,74)
EMPTY
EmptyG

(24,20)-(24,27)
EMPTY
EmptyG

(24,20)-(24,31)
EMPTY
EmptyG

(24,21)-(24,22)
EMPTY
EmptyG

(24,25)-(24,26)
EMPTY
EmptyG

(24,30)-(24,31)
EMPTY
EmptyG

(24,37)-(24,56)
EMPTY
EmptyG

(24,38)-(24,39)
EMPTY
EmptyG

(24,41)-(24,55)
EMPTY
EmptyG

(24,42)-(24,49)
EMPTY
EmptyG

(24,43)-(24,44)
EMPTY
EmptyG

(24,47)-(24,48)
EMPTY
EmptyG

(24,52)-(24,54)
EMPTY
EmptyG

(24,62)-(24,74)
EMPTY
EmptyG

(24,63)-(24,64)
EMPTY
EmptyG

(24,66)-(24,73)
EMPTY
EmptyG

(24,67)-(24,68)
EMPTY
EmptyG

(24,71)-(24,72)
EMPTY
EmptyG

(25,14)-(25,20)
EMPTY
EmptyG

(25,15)-(25,16)
EMPTY
EmptyG

(25,18)-(25,19)
EMPTY
EmptyG

*)
