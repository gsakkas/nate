
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
          if (j + k) > 10
          then (j = (1 k)) = ((j + k) - 10)
          else (j = (0 k)) = ((j + k) - 10) in
    let base = (0, 0) in
    let args = List.combine (clone l1 (List.length l2)) in
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
(16,6)-(22,43)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,12)-(16,13)
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(17,14)-(17,16)
EMPTY
EmptyG

(19,10)-(22,43)
EMPTY
EmptyG

(19,22)-(19,23)
EMPTY
EmptyG

(20,14)-(20,15)
EMPTY
EmptyG

(20,18)-(20,19)
x1
VarG

(20,23)-(20,25)
x2
VarG

(21,15)-(21,26)
EMPTY
EmptyG

(21,15)-(21,43)
EMPTY
EmptyG

(21,16)-(21,17)
EMPTY
EmptyG

(21,20)-(21,25)
(1 , (((x1 + x2) + a1) - 10) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing])

(21,23)-(21,24)
(((x1 + x2) + a1) - 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(21,31)-(21,32)
EMPTY
EmptyG

(21,35)-(21,36)
x1 + x2
BopG VarG VarG

(21,40)-(21,42)
a1
VarG

(22,15)-(22,26)
EMPTY
EmptyG

(22,15)-(22,43)
EMPTY
EmptyG

(22,16)-(22,17)
EMPTY
EmptyG

(22,20)-(22,25)
a2
VarG

(22,21)-(22,22)
(0 , ((x1 + x2) + a1) :: a2)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing])

(22,23)-(22,24)
EMPTY
EmptyG

(22,29)-(22,43)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(22,31)-(22,32)
EMPTY
EmptyG

(22,35)-(22,36)
EMPTY
EmptyG

(22,40)-(22,42)
x1 + x2
BopG VarG VarG

(23,4)-(25,51)
a2
VarG

(23,19)-(23,20)
[]
ListG EmptyG Nothing

(24,15)-(24,27)
List.rev
VarG

(24,29)-(24,34)
List.combine
VarG

(24,38)-(24,54)
EMPTY
EmptyG

(24,39)-(24,50)
EMPTY
EmptyG

*)
