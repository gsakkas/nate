
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t ->
          let z = [] in
          let (j,k) = x in
          if (j + k) > 9
          then z @ (1 :: (((h + j) + k) - 10) :: t)
          else z @ (0 :: ((h + j) + k) :: t) in
    let base = [0] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(21,44)
EMPTY
EmptyG

(14,12)-(14,13)
EMPTY
EmptyG

(15,14)-(15,16)
EMPTY
EmptyG

(17,10)-(21,44)
EMPTY
EmptyG

(17,18)-(17,20)
EMPTY
EmptyG

(19,10)-(21,44)
let (l , m) = a in
if ((j + k) + l) > 9
then (1 , (((j + k) + l) - 10) :: m)
else (0 , ((j + k) + l) :: m)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(19,14)-(19,15)
j + k
BopG VarG VarG

(19,23)-(19,24)
l
VarG

(20,15)-(20,16)
EMPTY
EmptyG

(20,15)-(20,51)
EMPTY
EmptyG

(20,17)-(20,18)
EMPTY
EmptyG

(20,19)-(20,51)
(1 , (((j + k) + l) - 10) :: m)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing])

(20,28)-(20,29)
EMPTY
EmptyG

(20,42)-(20,44)
l
VarG

(20,49)-(20,50)
EMPTY
EmptyG

(21,15)-(21,16)
EMPTY
EmptyG

(21,15)-(21,44)
EMPTY
EmptyG

(21,17)-(21,18)
EMPTY
EmptyG

(21,19)-(21,44)
m
VarG

(21,20)-(21,21)
(0 , ((j + k) + l) :: m)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(21,27)-(21,28)
EMPTY
EmptyG

(21,42)-(21,43)
l
VarG

(22,4)-(24,51)
m
VarG

(22,15)-(22,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(23,4)-(24,51)
[]
ListG EmptyG Nothing

*)
