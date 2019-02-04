
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
    let base = 0 in
    let args =
      let combo = List.combine (List.rev l1) (List.rev l2) in
      match combo with
      | (i,j)::t -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
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

(20,15)-(20,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,4)-(26,51)
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

(24,20)-(24,77)
EMPTY
EmptyG

(24,23)-(24,30)
EMPTY
EmptyG

(24,23)-(24,34)
EMPTY
EmptyG

(24,24)-(24,25)
EMPTY
EmptyG

(24,28)-(24,29)
EMPTY
EmptyG

(24,33)-(24,34)
EMPTY
EmptyG

(24,40)-(24,59)
EMPTY
EmptyG

(24,41)-(24,42)
EMPTY
EmptyG

(24,44)-(24,58)
EMPTY
EmptyG

(24,45)-(24,52)
EMPTY
EmptyG

(24,46)-(24,47)
EMPTY
EmptyG

(24,50)-(24,51)
EMPTY
EmptyG

(24,55)-(24,57)
EMPTY
EmptyG

(24,65)-(24,77)
EMPTY
EmptyG

(24,66)-(24,67)
EMPTY
EmptyG

(24,69)-(24,76)
EMPTY
EmptyG

(24,70)-(24,71)
EMPTY
EmptyG

(24,74)-(24,75)
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
