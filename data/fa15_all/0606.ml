
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let lr1 = List.rev l1 in
      let lr2 = List.rev l2 in
      let h1::t1 = lr1 in
      let h2::t2 = lr2 in
      if (h1 + h2) > 9
      then x ((1, [(h1 + h2) - 10]) :: a)
      else x ((0, [h1 + h2]) :: a) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      let val2 = (x1 + x2) / 10 in (val2, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(22,34)
EMPTY
EmptyG

(16,16)-(16,24)
EMPTY
EmptyG

(16,16)-(16,27)
EMPTY
EmptyG

(16,25)-(16,27)
EMPTY
EmptyG

(17,6)-(22,34)
EMPTY
EmptyG

(17,16)-(17,24)
EMPTY
EmptyG

(17,16)-(17,27)
EMPTY
EmptyG

(17,25)-(17,27)
EMPTY
EmptyG

(18,6)-(22,34)
EMPTY
EmptyG

(18,19)-(18,22)
EMPTY
EmptyG

(19,6)-(22,34)
EMPTY
EmptyG

(19,19)-(19,22)
EMPTY
EmptyG

(20,6)-(22,34)
EMPTY
EmptyG

(20,9)-(20,18)
EMPTY
EmptyG

(20,9)-(20,22)
EMPTY
EmptyG

(20,10)-(20,12)
EMPTY
EmptyG

(20,15)-(20,17)
EMPTY
EmptyG

(20,21)-(20,22)
EMPTY
EmptyG

(21,11)-(21,12)
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,11)-(21,41)
let (a1 , a2) = a in
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,13)-(21,41)
EMPTY
EmptyG

(21,14)-(21,35)
EMPTY
EmptyG

(21,15)-(21,16)
EMPTY
EmptyG

(21,18)-(21,34)
EMPTY
EmptyG

(21,19)-(21,33)
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,20)-(21,22)
EMPTY
EmptyG

(21,25)-(21,27)
a1 + x1
BopG VarG VarG

(21,31)-(21,33)
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,39)-(21,40)
EMPTY
EmptyG

(22,11)-(22,12)
(val2 , val1 :: a2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG])))])

(22,11)-(22,34)
EMPTY
EmptyG

(22,13)-(22,34)
val2
VarG

(22,14)-(22,28)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,18)-(22,27)
EMPTY
EmptyG

(22,19)-(22,21)
EMPTY
EmptyG

(22,19)-(22,26)
EMPTY
EmptyG

(22,24)-(22,26)
EMPTY
EmptyG

(22,32)-(22,33)
EMPTY
EmptyG

(23,4)-(25,51)
EMPTY
EmptyG

*)

(* typed spans
(int * int list)
(int * int list)
(int * int list)
int
(int * int list)
(int * int list)
int
int list
*)
