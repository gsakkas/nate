
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (y,z) = x in [y +. z] @ a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,45)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
IteG (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,33)-(14,45)
let (carry , ans) = a in
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(14,34)-(14,35)
(y + z) + carry
BopG (BopG EmptyG EmptyG) VarG

(14,34)-(14,40)
((y + z) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(14,44)-(14,45)
let (carry , ans) = a in
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(15,4)-(17,51)
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
TupleG (fromList [LitG,LetG NonRec (fromList [EmptyG]) EmptyG])

(15,15)-(15,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* typed spans
(15,6)-(21,57)
(17,8)-(18,64)
(18,31)-(18,48)
(18,31)-(18,55)
(20,8)-(21,57)
(21,9)-(21,56)
(22,15)-(22,22)
*)

(* typed spans
(int * int list)
(int * int list)
int
int
(int * int list)
(int * int list)
(int * int list)
*)

(* typed spans
float list
float list
float
float
float list
'a
float list
*)
