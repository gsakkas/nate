
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args =
      let combine (a,b) = a + b in
      List.map f (List.rev (List.combine (l1 l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,45)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])

(19,16)-(19,44)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(22,16)-(22,17)
combine
VarG

(22,28)-(22,50)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(20,5)-(23,52)
(21,7)-(22,51)
(22,7)-(22,15)
(22,7)-(22,51)
(22,16)-(22,17)
(22,18)-(22,51)
(22,19)-(22,27)
(22,28)-(22,50)
(22,29)-(22,41)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,41)-(23,45)
*)
