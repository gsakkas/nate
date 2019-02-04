
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

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
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,7)-(7,59)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,23)-(9,31)
EMPTY
EmptyG

(9,23)-(9,51)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(9,32)-(9,51)
removeZero
VarG

(11,11)-(17,34)
l
VarG

(13,16)-(13,24)
EMPTY
EmptyG

(13,16)-(13,44)
EMPTY
EmptyG

(13,25)-(13,44)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(14,4)-(16,51)
let sum = y + z in
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(14,15)-(14,23)
EMPTY
EmptyG

(14,15)-(14,43)
EMPTY
EmptyG

(14,24)-(14,43)
[]
ListG EmptyG Nothing

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
