
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> if sum > 9 then [(1, (sum - 1))] else [sum]
      | c::x' ->
          if (sum + c) > 9
          then 1 :: ((sum + c) - 10) :: x'
          else (sum + c) :: x' in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> [sum]
      | c::x' -> if c > 9 then (sum + 1) :: (c - 10) :: x' else sum :: a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,14)-(19,57)
EMPTY
EmptyG

(19,17)-(19,20)
EMPTY
EmptyG

(19,17)-(19,24)
EMPTY
EmptyG

(19,23)-(19,24)
EMPTY
EmptyG

(19,31)-(19,45)
EMPTY
EmptyG

(19,32)-(19,33)
EMPTY
EmptyG

(19,35)-(19,44)
EMPTY
EmptyG

(19,42)-(19,43)
EMPTY
EmptyG

(19,52)-(19,57)
EMPTY
EmptyG

(19,53)-(19,56)
EMPTY
EmptyG

(21,13)-(21,22)
EMPTY
EmptyG

(21,14)-(21,17)
EMPTY
EmptyG

(22,15)-(22,16)
sum + 1
BopG VarG LitG

(22,21)-(22,30)
EMPTY
EmptyG

(22,22)-(22,25)
EMPTY
EmptyG

(23,15)-(23,24)
EMPTY
EmptyG

(23,22)-(23,23)
EMPTY
EmptyG

(23,28)-(23,30)
a
VarG

(26,4)-(26,51)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
