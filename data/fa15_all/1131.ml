
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
      match a with
      | (c,d) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, ((((fst x) + (snd x)) + c) mod 10))
          else (0, ((((fst x) + (snd x)) + c) mod 10))
      | (0,[]) ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, (((fst x) + (snd x)) mod 10)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
      match a with
      | (c,h::t) ->
          if (((fst x) + (snd x)) + c) > 9
          then (1, (((((fst x) + (snd x)) + c) mod 10) :: t))
          else (0, (((((fst x) + (snd x)) + c) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(26,48)
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(21,19)-(21,53)
(((fst x + snd x) + c) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG]))) Nothing

(22,15)-(22,54)
t
VarG

(22,19)-(22,53)
(((fst x + snd x) + c) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG]))) Nothing

(24,10)-(26,48)
EMPTY
EmptyG

(24,13)-(24,32)
EMPTY
EmptyG

(24,13)-(24,36)
EMPTY
EmptyG

(24,14)-(24,21)
EMPTY
EmptyG

(24,15)-(24,18)
EMPTY
EmptyG

(24,19)-(24,20)
EMPTY
EmptyG

(24,24)-(24,31)
EMPTY
EmptyG

(24,25)-(24,28)
EMPTY
EmptyG

(24,29)-(24,30)
EMPTY
EmptyG

(24,35)-(24,36)
EMPTY
EmptyG

(25,15)-(25,48)
EMPTY
EmptyG

(25,16)-(25,17)
EMPTY
EmptyG

(25,19)-(25,47)
EMPTY
EmptyG

(25,20)-(25,39)
EMPTY
EmptyG

(25,20)-(25,46)
EMPTY
EmptyG

(25,21)-(25,28)
EMPTY
EmptyG

(25,22)-(25,25)
EMPTY
EmptyG

(25,26)-(25,27)
EMPTY
EmptyG

(25,31)-(25,38)
EMPTY
EmptyG

(25,32)-(25,35)
EMPTY
EmptyG

(25,36)-(25,37)
EMPTY
EmptyG

(25,44)-(25,46)
EMPTY
EmptyG

(26,15)-(26,48)
EMPTY
EmptyG

(26,16)-(26,17)
EMPTY
EmptyG

(26,19)-(26,47)
EMPTY
EmptyG

(26,20)-(26,39)
EMPTY
EmptyG

(26,21)-(26,28)
EMPTY
EmptyG

(26,22)-(26,25)
EMPTY
EmptyG

(26,26)-(26,27)
EMPTY
EmptyG

(26,31)-(26,38)
EMPTY
EmptyG

(26,32)-(26,35)
EMPTY
EmptyG

(26,36)-(26,37)
EMPTY
EmptyG

(26,44)-(26,46)
t
VarG

*)
