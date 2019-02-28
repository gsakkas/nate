
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> [] | h::t -> (x + h) :: a in
    let base = [] in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,16)-(17,63)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(17,52)-(17,53)
fst x
AppG (fromList [VarG])

(17,56)-(17,57)
snd x
AppG (fromList [VarG])

(17,62)-(17,63)
(sum - 10) + fst a
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(18,4)-(19,68)
sum + fst a
BopG VarG (AppG (fromList [EmptyG]))

(18,15)-(18,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(19,15)-(19,17)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* typed spans
(18,6)-(21,44)
(18,16)-(18,23)
(18,26)-(18,33)
(20,16)-(20,38)
(21,16)-(21,31)
(22,15)-(22,22)
(23,15)-(23,33)
*)

(* typed spans
(int * int list)
int
int
int
int
(int * int list)
(int * int) list
*)

(* typed spans
int list
int
int
int list
int list
int list
int list
*)
