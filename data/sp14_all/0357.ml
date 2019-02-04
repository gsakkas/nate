
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [a; (x + y) mod 10] in
    let base = [] in
    let args = failwith List.combine l1 l2 in
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
(14,16)-(14,59)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(14,40)-(14,59)
let sum = y + z in
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(14,41)-(14,42)
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(14,44)-(14,58)
(sum + h) / 10
BopG (BopG EmptyG EmptyG) LitG

(14,45)-(14,46)
EMPTY
EmptyG

(14,49)-(14,50)
sum
VarG

(14,56)-(14,58)
h
VarG

(15,4)-(17,51)
[sum / 10 ; sum mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(16,15)-(16,23)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(16,15)-(16,42)
EMPTY
EmptyG

(16,24)-(16,36)
List.combine l1 l2
AppG (fromList [VarG])

(17,4)-(17,51)
EMPTY
EmptyG

(17,48)-(17,51)
EMPTY
EmptyG

*)
