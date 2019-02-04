
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x c =
      let (s,t) = x in
      let sum = (c + s) + t in ((sum / 10) (sum mod 10)) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,14)-(17,61)
EMPTY
EmptyG

(16,6)-(17,61)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,6)-(17,61)
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,21)-(17,22)
EMPTY
EmptyG

(17,26)-(17,27)
EMPTY
EmptyG

(17,31)-(17,56)
x''
VarG

(17,31)-(17,61)
EMPTY
EmptyG

(17,32)-(17,42)
(((c + x') + x'') mod 10) :: s
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(17,33)-(17,36)
x'
VarG

(17,39)-(17,41)
c + x'
BopG VarG VarG

(17,44)-(17,47)
(c + x') + x''
BopG (BopG EmptyG EmptyG) VarG

(17,52)-(17,54)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,60)-(17,61)
s
VarG

*)
