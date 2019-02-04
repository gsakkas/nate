
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in ((sum / 10) ::
            (sum mod 10)) :: t in
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
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,16)-(8,17)
fun x ->
  fun n ->
    if n < 1
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(4,7)-(4,14)
EMPTY
EmptyG

(4,7)-(4,27)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(4,15)-(4,24)
(@)
VarG

(4,16)-(4,17)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(4,21)-(4,23)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,25)-(4,27)
l1
VarG

(7,9)-(7,16)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,9)-(7,29)
EMPTY
EmptyG

(7,20)-(7,29)
clone 0
      (List.length l1 - List.length l2) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(7,21)-(7,22)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,26)-(7,28)
List.length l1 - List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(8,9)-(8,17)
l2
VarG

(16,6)-(19,30)
EMPTY
EmptyG

(16,12)-(16,13)
EMPTY
EmptyG

(18,10)-(19,30)
EMPTY
EmptyG

(18,20)-(18,49)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,42)-(18,49)
EMPTY
EmptyG

(18,43)-(18,46)
EMPTY
EmptyG

(18,47)-(18,48)
EMPTY
EmptyG

(18,53)-(19,25)
a
VarG

(18,53)-(19,30)
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(18,55)-(18,58)
h + b
BopG VarG VarG

(18,61)-(18,63)
b
VarG

(19,12)-(19,24)
((h + b) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing

(19,13)-(19,16)
h + b
BopG VarG VarG

(19,21)-(19,23)
b
VarG

(20,4)-(21,74)
[b / 10 ; b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
