
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
      let sum = ((fst x) + (snd x)) + (fst a) in ((sum / 10), (sum mod 10)) in
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
(16,6)-(16,75)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,38)-(16,45)
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

(16,49)-(16,75)
((h + b) / 10) :: (((h + b) mod 10) :: t)
ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG])))])))

(16,51)-(16,54)
h + b
BopG VarG VarG

(16,57)-(16,59)
b
VarG

(16,62)-(16,74)
((h + b) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG])))

(16,63)-(16,66)
h + b
BopG VarG VarG

(16,71)-(16,73)
b
VarG

(17,4)-(19,51)
[b / 10 ; b mod 10]
ListG (BopG EmptyG EmptyG)

(19,4)-(19,51)
EMPTY
EmptyG

(19,48)-(19,51)
EMPTY
EmptyG

*)

(* typed spans
(16,6)-(19,31)
(17,6)-(19,31)
(18,16)-(18,55)
(18,17)-(18,24)
(18,22)-(18,23)
(18,34)-(18,55)
(18,35)-(18,42)
(18,40)-(18,41)
(19,13)-(19,31)
*)

(* typed spans
int list
int list
int list
int
int
int list
int
int
int list
*)

(* typed spans
(int * int)
int
(int * int)
int
int
int
int
int
int list
*)
