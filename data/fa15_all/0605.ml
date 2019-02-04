
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
      then (1, [(h1 + h2) - 10]) :: x
      else (0, [h1 + h2]) :: x in
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
(16,6)-(22,30)
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

(17,6)-(22,30)
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

(18,6)-(22,30)
EMPTY
EmptyG

(18,19)-(18,22)
EMPTY
EmptyG

(19,6)-(22,30)
EMPTY
EmptyG

(19,19)-(19,22)
EMPTY
EmptyG

(20,6)-(22,30)
EMPTY
EmptyG

(20,9)-(20,18)
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,9)-(20,22)
let (a1 , a2) = a in
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,10)-(20,12)
EMPTY
EmptyG

(20,15)-(20,17)
EMPTY
EmptyG

(20,21)-(20,22)
EMPTY
EmptyG

(21,11)-(21,32)
EMPTY
EmptyG

(21,11)-(21,37)
EMPTY
EmptyG

(21,12)-(21,13)
EMPTY
EmptyG

(21,15)-(21,31)
EMPTY
EmptyG

(21,16)-(21,30)
EMPTY
EmptyG

(21,17)-(21,19)
EMPTY
EmptyG

(21,22)-(21,24)
a1
VarG

(21,28)-(21,30)
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,36)-(21,37)
(val2 , val1 :: a2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(22,11)-(22,25)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,11)-(22,30)
val2
VarG

(22,15)-(22,24)
EMPTY
EmptyG

(22,16)-(22,18)
EMPTY
EmptyG

(22,16)-(22,23)
EMPTY
EmptyG

(22,21)-(22,23)
EMPTY
EmptyG

(22,29)-(22,30)
EMPTY
EmptyG

(23,4)-(25,51)
EMPTY
EmptyG

*)
