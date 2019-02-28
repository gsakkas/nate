
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let addTuple (l1,l2) = l1 + l2;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a + x) mod 10 in
    let base = 0 in
    let args = List.map addTuple (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,14)-(4,30)
EMPTY
EmptyG

(19,16)-(19,30)
let (x1 , x2) = x in
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,17)-(19,18)
x1 + x2
BopG VarG VarG

(19,28)-(19,30)
carry
VarG

(20,4)-(22,51)
res
VarG

(20,15)-(20,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(21,4)-(22,51)
[]
ListG EmptyG

(21,15)-(21,53)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(21,33)-(21,53)
List.rev
VarG

*)

(* typed spans
(18,6)-(20,73)
(20,38)-(20,47)
(20,50)-(20,55)
(20,68)-(20,71)
(21,15)-(21,22)
(21,19)-(21,21)
(22,15)-(22,44)
(22,15)-(22,23)
*)

(* typed spans
(int * int list)
int
int
int list
(int * int list)
int list
(int * int) list
(int * int) list -> (int * int) list
*)

(* typed spans
int
int
int
int list
int
int list
int list
(int * int) list
*)
