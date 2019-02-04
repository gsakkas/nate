
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
      if let (y,z) = x in (y + z) > 9
      then (1, (let (y,z) = x in (y + z) mod 10)) + a
      else (0, (let (y,z) = x in y + z)) + a in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
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
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,9)-(15,37)
let (carry , ans) = a in
let (y , z) = x in
((y + z) + carry) > 9
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(15,27)-(15,28)
y + z
BopG VarG VarG

(15,36)-(15,37)
carry
VarG

(16,11)-(16,49)
a
VarG

(16,11)-(16,53)
let (carry , ans) = a in
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(16,33)-(16,47)
[((y + z) + carry) mod 10] @ ans
AppG (fromList [VarG,ListG EmptyG Nothing])

(16,34)-(16,35)
y + z
BopG VarG VarG

(16,45)-(16,47)
carry
VarG

(16,52)-(16,53)
let (carry , ans) = a in
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,11)-(17,44)
EMPTY
EmptyG

(17,33)-(17,34)
y + z
BopG VarG VarG

(17,33)-(17,38)
[(y + z) + carry] @ ans
AppG (fromList [VarG,ListG EmptyG Nothing])

(17,43)-(17,44)
carry
VarG

(18,4)-(20,51)
ans
VarG

(18,19)-(18,20)
[]
ListG EmptyG Nothing

*)
