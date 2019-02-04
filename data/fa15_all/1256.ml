
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
      | [] -> if sum > 9 then [1; sum - 1] else [0; sum]
      | c::x' ->
          if (sum + c) > 9
          then 1 :: ((sum + c) - 10) :: x'
          else 0 :: (sum + c) :: x' in
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
(19,14)-(19,56)
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

(19,30)-(19,42)
EMPTY
EmptyG

(19,31)-(19,32)
EMPTY
EmptyG

(19,34)-(19,37)
EMPTY
EmptyG

(19,34)-(19,41)
EMPTY
EmptyG

(19,40)-(19,41)
EMPTY
EmptyG

(19,48)-(19,56)
EMPTY
EmptyG

(19,49)-(19,50)
[sum]
ListG VarG Nothing

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

(23,15)-(23,16)
EMPTY
EmptyG

(23,20)-(23,29)
EMPTY
EmptyG

(23,20)-(23,35)
EMPTY
EmptyG

(23,27)-(23,28)
EMPTY
EmptyG

(23,33)-(23,35)
a
VarG

(26,4)-(26,51)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
