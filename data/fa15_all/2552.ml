
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  let sizDif = length1 - length2 in
  if sizDif > 0
  then l1 :: (clone 0 sizDif) :: l2
  else ((clone 0 (- sizDif)) :: l1) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(5,2)-(10,41)
let sizDif =
  List.length l1 - List.length l2 in
if sizDif > 0
then (let pad =
        clone 0 sizDif in
      (l1 , pad @ l2))
else (let pad =
        clone 0 (- sizDif) in
      (pad @ l1 , l2))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(5,16)-(5,30)
List.length l1 - List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,2)-(10,41)
EMPTY
EmptyG

(7,2)-(10,41)
EMPTY
EmptyG

(9,7)-(9,35)
let pad = clone 0 sizDif in
(l1 , pad @ l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(9,33)-(9,35)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,7)-(10,41)
let pad =
  clone 0 (- sizDif) in
(pad @ l1 , l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(10,32)-(10,34)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* typed spans
(5,2)-(8,57)
(5,15)-(5,50)
(7,7)-(7,51)
(7,35)-(7,51)
(8,7)-(8,57)
(8,40)-(8,56)
*)

(* typed spans
(int list * int list)
int
(int list * int list)
(int list * int list)
(int list * int list)
(int list * int list)
*)

(* typed spans
int list list list
int
int list list
int list list
int list list list
int list
*)
