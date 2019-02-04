
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then let asd = (x / h) :: t in (asd, (padZero (asd, ((x + h) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,21)-(22,33)
EMPTY
EmptyG

(22,32)-(22,33)
EMPTY
EmptyG

(22,37)-(22,75)
EMPTY
EmptyG

(22,38)-(22,41)
EMPTY
EmptyG

(22,43)-(22,74)
EMPTY
EmptyG

(22,44)-(22,51)
EMPTY
EmptyG

(22,52)-(22,73)
EMPTY
EmptyG

(22,53)-(22,56)
EMPTY
EmptyG

(22,58)-(22,72)
let asd2 =
  (x + h) - (asd * 10) in
let asd3 = asd :: t in
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,59)-(22,66)
(x + h) - (asd * 10)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(22,70)-(22,71)
let asd3 = asd :: t in
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
LetG NonRec (fromList [ConAppG (Just EmptyG) Nothing]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,12)-(23,13)
(t , (x + h) :: b)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

*)
