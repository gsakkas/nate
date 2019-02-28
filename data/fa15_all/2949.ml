
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = match x with | _ -> (-1) | (first,second) -> first + second in
      (sum / 10) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,6)-(18,21)
let (lh1 , lh2) = x in
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,36)-(17,40)
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,61)-(17,66)
lh1 + lh2
BopG VarG VarG

(17,61)-(17,75)
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(18,6)-(18,16)
(num / 10 , (num mod 10) :: res)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

(18,7)-(18,10)
num
VarG

(18,20)-(18,21)
(num mod 10) :: res
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))

(19,4)-(21,51)
num mod 10
BopG VarG LitG

(19,15)-(19,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* typed spans
(17,6)-(19,74)
(18,6)-(19,74)
(19,16)-(19,27)
(19,6)-(19,74)
(19,39)-(19,74)
(19,41)-(19,44)
(19,52)-(19,73)
(19,53)-(19,65)
(20,15)-(20,22)
*)

(* typed spans
(int * int list)
(int * int list)
int
(int * int list)
(int * int list)
int
int list
int
(int * int list)
*)

(* typed spans
int list
int
int
int
int
int
int list
int list
int list
*)
