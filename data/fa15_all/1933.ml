
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone 0 ((List.length l1) - (List.length l2))
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
    else [];;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
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
(6,7)-(6,12)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,7)-(6,52)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,4)-(10,11)
l2
VarG

(9,9)-(9,14)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,9)-(9,54)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,9)-(10,11)
l1
VarG

(12,19)-(12,51)
(l1 , l2)
TupleG (fromList [VarG])

(12,23)-(12,31)
EMPTY
EmptyG

(12,23)-(12,51)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else h :: t
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(12,32)-(12,51)
removeZero
VarG

(14,11)-(20,34)
t
VarG

(16,16)-(16,24)
EMPTY
EmptyG

(16,16)-(16,44)
EMPTY
EmptyG

(16,25)-(16,44)
let (x1 , x2) = x in
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,4)-(19,51)
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,15)-(17,23)
EMPTY
EmptyG

(17,15)-(17,43)
EMPTY
EmptyG

(17,24)-(17,43)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,4)-(19,51)
[]
ListG EmptyG Nothing

(18,15)-(18,23)
EMPTY
EmptyG

(18,24)-(18,43)
List.rev
VarG

(19,4)-(19,51)
List.combine l1 l2
AppG (fromList [VarG])

*)
