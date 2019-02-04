
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

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
    let f a x = x + a in
    let base = [] in
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

(16,16)-(16,17)
addHelper (a , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(16,16)-(16,21)
EMPTY
EmptyG

(16,20)-(16,21)
(a , x)
TupleG (fromList [VarG])

(17,4)-(18,74)
x
VarG

(18,15)-(18,23)
EMPTY
EmptyG

(18,16)-(18,18)
EMPTY
EmptyG

(18,20)-(18,22)
EMPTY
EmptyG

(18,27)-(18,74)
[]
ListG EmptyG Nothing

(18,71)-(18,74)
EMPTY
EmptyG

*)
