
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let x l = List.map string_of_int;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x + a in
    let base = x in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,12)-(9,43)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(14,6)-(14,32)
EMPTY
EmptyG

(14,10)-(14,18)
EMPTY
EmptyG

(14,10)-(14,32)
EMPTY
EmptyG

(14,19)-(14,32)
EMPTY
EmptyG

(18,16)-(18,17)
addHelper (a , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,16)-(18,21)
EMPTY
EmptyG

(18,20)-(18,21)
(a , x)
TupleG (fromList [VarG])

(19,4)-(20,74)
EMPTY
EmptyG

(20,4)-(20,74)
let base = [] in
let args = [] in
List.fold_left f base args
LetG NonRec (fromList [ListG EmptyG Nothing]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,23)
EMPTY
EmptyG

(20,16)-(20,18)
EMPTY
EmptyG

(20,20)-(20,22)
EMPTY
EmptyG

(20,27)-(20,74)
[]
ListG EmptyG Nothing

(20,71)-(20,74)
EMPTY
EmptyG

*)
