
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let rec helper curList lt1 lt2 =
  match lt1 with
  | [] -> curList
  | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (m,n) = a in let (o,p) = x in ((m + o), (n + p)) in
    let base = (0, 0) in
    let args = helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = a in
      let (o,p) = x in
      let z = (o + p) + m in
      if z > 9 then (1, ((z - 10) :: n)) else (0, (z :: n)) in
    let base = (0, []) in
    let args =
      let rec helper curList lt1 lt2 =
        match lt1 with
        | [] -> curList
        | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2) in
      helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,15)-(8,66)
EMPTY
EmptyG

(5,23)-(8,66)
EMPTY
EmptyG

(5,27)-(8,66)
EMPTY
EmptyG

(6,2)-(8,66)
EMPTY
EmptyG

(6,8)-(6,11)
EMPTY
EmptyG

(7,10)-(7,17)
EMPTY
EmptyG

(8,12)-(8,18)
EMPTY
EmptyG

(8,12)-(8,66)
EMPTY
EmptyG

(8,19)-(8,50)
EMPTY
EmptyG

(8,20)-(8,38)
EMPTY
EmptyG

(8,21)-(8,22)
EMPTY
EmptyG

(8,24)-(8,37)
EMPTY
EmptyG

(8,25)-(8,32)
EMPTY
EmptyG

(8,33)-(8,36)
EMPTY
EmptyG

(8,42)-(8,49)
EMPTY
EmptyG

(8,51)-(8,52)
EMPTY
EmptyG

(8,53)-(8,66)
EMPTY
EmptyG

(8,54)-(8,61)
EMPTY
EmptyG

(8,62)-(8,65)
EMPTY
EmptyG

(22,50)-(22,68)
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(22,52)-(22,53)
EMPTY
EmptyG

(22,56)-(22,57)
EMPTY
EmptyG

(22,61)-(22,62)
o
VarG

(23,4)-(25,51)
m
VarG

(23,15)-(23,21)
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(23,16)-(23,17)
(0 , z :: n)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(23,19)-(23,20)
let base = (0 , []) in
let args =
  (let rec helper =
     fun curList ->
       fun lt1 ->
         fun lt2 ->
           match lt1 with
           | [] -> curList
           | h :: t -> helper ((h , List.hd lt2) :: curList)
                              t (List.tl lt2) in
   helper [] l1 l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(24,4)-(25,51)
[]
ListG EmptyG Nothing

(24,15)-(24,30)
let rec helper =
  fun curList ->
    fun lt1 ->
      fun lt2 ->
        match lt1 with
        | [] -> curList
        | h :: t -> helper ((h , List.hd lt2) :: curList)
                           t (List.tl lt2) in
helper [] l1 l2
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(24,22)-(24,24)
helper [] l1 l2
AppG (fromList [VarG,ListG EmptyG Nothing])

*)
