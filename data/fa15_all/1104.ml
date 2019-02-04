
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in
          ((sum / 10), (sum mod 10)) :: t in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(19,41)
EMPTY
EmptyG

(16,12)-(16,13)
EMPTY
EmptyG

(18,10)-(19,41)
EMPTY
EmptyG

(18,20)-(18,49)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,42)-(18,49)
EMPTY
EmptyG

(18,43)-(18,46)
EMPTY
EmptyG

(18,47)-(18,48)
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(19,10)-(19,36)
EMPTY
EmptyG

(19,10)-(19,41)
a
VarG

(19,12)-(19,15)
h + b
BopG VarG VarG

(19,18)-(19,20)
b
VarG

(19,23)-(19,35)
((h + b) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing

(19,24)-(19,27)
h + b
BopG VarG VarG

(19,32)-(19,34)
b
VarG

(20,4)-(22,51)
[b / 10 ; b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(22,4)-(22,51)
EMPTY
EmptyG

(22,48)-(22,51)
EMPTY
EmptyG

*)
