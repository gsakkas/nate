
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,17)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(20,4)-(22,51)
a
VarG

(20,4)-(22,51)
a1
VarG

(20,4)-(22,51)
x1
VarG

(20,4)-(22,51)
x2
VarG

(20,4)-(22,51)
h
VarG

(20,4)-(22,51)
x1
VarG

(20,4)-(22,51)
x2
VarG

(20,4)-(22,51)
h
VarG

(20,4)-(22,51)
tens
VarG

(20,4)-(22,51)
a1
VarG

(20,4)-(22,51)
ones
VarG

(20,4)-(22,51)
a2
VarG

(20,4)-(22,51)
x1 + x2
BopG VarG VarG

(20,4)-(22,51)
(x1 + x2) + (h / 10)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(20,4)-(22,51)
h / 10
BopG VarG LitG

(20,4)-(22,51)
x1 + x2
BopG VarG VarG

(20,4)-(22,51)
(x1 + x2) + (h mod 10)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(20,4)-(22,51)
h mod 10
BopG VarG LitG

(20,4)-(22,51)
10
LitG

(20,4)-(22,51)
10
LitG

(20,4)-(22,51)
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(20,4)-(22,51)
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(20,4)-(22,51)
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(20,4)-(22,51)
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [BopG EmptyG EmptyG] (TupleG [EmptyG,EmptyG])

(20,4)-(22,51)
(tens :: a1 , ones :: a2)
TupleG [ConAppG (Just (TupleG [VarG,VarG])) Nothing,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(20,4)-(22,51)
tens :: a1
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(20,4)-(22,51)
ones :: a2
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(20,15)-(20,16)
([] , [])
TupleG [ListG EmptyG Nothing,ListG EmptyG Nothing]

(21,4)-(22,51)
[]
ListG EmptyG Nothing

(21,4)-(22,51)
[]
ListG EmptyG Nothing

(21,15)-(21,33)
List.rev
VarG

(21,15)-(21,33)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)