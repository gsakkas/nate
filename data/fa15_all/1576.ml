
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then clone l1 ((List.length l2) - (List.length l1))
  else clone l2 ((List.length l1) - (List.length l2));;

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
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,12)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,7)-(6,53)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,13)-(6,15)
0
LitG

(7,7)-(7,12)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,7)-(7,53)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,13)-(7,15)
0
LitG

(9,19)-(9,51)
(l1 , l2)
TupleG (fromList [VarG])

(9,23)-(9,31)
EMPTY
EmptyG

(9,23)-(9,51)
match l with
| h :: t -> if h = 0
            then removeZero t
            else l
| _ -> []
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])

(9,32)-(9,51)
removeZero
VarG

(11,11)-(17,34)
[]
ListG EmptyG

(13,16)-(13,24)
EMPTY
EmptyG

(13,16)-(13,44)
let sum = fst x + snd x in
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(13,25)-(13,44)
EMPTY
EmptyG

(14,4)-(16,51)
fst
VarG

(14,15)-(14,23)
EMPTY
EmptyG

(14,15)-(14,43)
x
VarG

(14,24)-(14,43)
snd
VarG

(15,4)-(16,51)
let base = [] in
let args =
  List.rev (List.combine l1
                         l2) in
List.fold_left f base args
LetG NonRec (fromList [ListG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(15,15)-(15,23)
EMPTY
EmptyG

(15,24)-(15,43)
EMPTY
EmptyG

(16,4)-(16,51)
List.rev
VarG

(16,18)-(16,44)
List.combine l1 l2
AppG (fromList [VarG])

(16,48)-(16,51)
EMPTY
EmptyG

*)

(* typed spans
int list
(int list * int list)
int
int list
(int list * int list)
int
(int list * int list)
int list
int list -> int list
int list
int list
(int * int) -> int
(int * int)
(int * int) -> int
int list
(int * int) list -> (int * int) list
(int * int) list
*)
