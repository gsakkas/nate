
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
      match x with
      | [] -> if a1 = 0 then [] else [a1]
      | (x1,x2)::t ->
          let value = (a1 + x1) + x2 in
          if value > 9 then (1, (value - 10)) :: a else value :: a in
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
(17,6)-(21,66)
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,14)-(18,41)
EMPTY
EmptyG

(18,17)-(18,19)
EMPTY
EmptyG

(18,17)-(18,23)
EMPTY
EmptyG

(18,22)-(18,23)
EMPTY
EmptyG

(18,29)-(18,31)
EMPTY
EmptyG

(18,37)-(18,41)
EMPTY
EmptyG

(18,38)-(18,40)
EMPTY
EmptyG

(20,10)-(21,66)
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,10)-(21,66)
EMPTY
EmptyG

(21,13)-(21,18)
EMPTY
EmptyG

(21,13)-(21,22)
EMPTY
EmptyG

(21,21)-(21,22)
EMPTY
EmptyG

(21,28)-(21,45)
EMPTY
EmptyG

(21,28)-(21,50)
EMPTY
EmptyG

(21,29)-(21,30)
EMPTY
EmptyG

(21,32)-(21,44)
EMPTY
EmptyG

(21,33)-(21,38)
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,41)-(21,43)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(21,49)-(21,50)
(val2 , val1 :: a2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(21,56)-(21,61)
EMPTY
EmptyG

(21,56)-(21,66)
val2
VarG

(21,65)-(21,66)
val1
VarG

(22,4)-(24,51)
a2
VarG

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
