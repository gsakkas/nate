
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> (h + (sum / 10)) :: ((h + sum) mod 10) :: t
      | _ -> (((fst x) + (snd x)) / 10) :: (((fst x) + (snd x)) mod 10) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,71)
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing]))) Nothing)])

(20,16)-(20,32)
(h + sum) / 10
BopG (BopG EmptyG EmptyG) LitG

(20,21)-(20,31)
EMPTY
EmptyG

(21,13)-(21,39)
EMPTY
EmptyG

(21,13)-(21,71)
EMPTY
EmptyG

(21,14)-(21,33)
EMPTY
EmptyG

(21,15)-(21,22)
EMPTY
EmptyG

(21,16)-(21,19)
EMPTY
EmptyG

(21,20)-(21,21)
EMPTY
EmptyG

(21,25)-(21,32)
EMPTY
EmptyG

(21,26)-(21,29)
EMPTY
EmptyG

(21,30)-(21,31)
EMPTY
EmptyG

(21,36)-(21,38)
EMPTY
EmptyG

(21,43)-(21,71)
EMPTY
EmptyG

(21,44)-(21,63)
EMPTY
EmptyG

(21,45)-(21,52)
EMPTY
EmptyG

(21,46)-(21,49)
EMPTY
EmptyG

(21,50)-(21,51)
EMPTY
EmptyG

(21,55)-(21,62)
EMPTY
EmptyG

(21,56)-(21,59)
EMPTY
EmptyG

(21,60)-(21,61)
EMPTY
EmptyG

(21,68)-(21,70)
EMPTY
EmptyG

*)
