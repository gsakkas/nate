
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
      let sum = (c + s) + t in ((sum / 10), ((sum mod 10) :: a)) in
    let base = (0, [0]) in
    let args = ((List.rev (List.hd l1)), (List.rev (List.hd l2))) in
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
(16,6)-(17,64)
a
VarG

(16,6)-(17,64)
((c + x') + x'') / 10
BopG (BopG EmptyG EmptyG) LitG

(16,6)-(17,64)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,6)-(17,64)
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(17,6)-(17,64)
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,31)-(17,64)
x''
VarG

(17,33)-(17,36)
x'
VarG

(17,44)-(17,63)
c
VarG

(17,44)-(17,63)
x'
VarG

(17,44)-(17,63)
x''
VarG

(17,44)-(17,63)
c + x'
BopG VarG VarG

(17,46)-(17,49)
(c + x') + x''
BopG (BopG EmptyG EmptyG) VarG

(17,61)-(17,62)
s
VarG

(18,20)-(18,21)
[]
ListG EmptyG Nothing

(19,17)-(19,25)
List.combine
VarG

(19,27)-(19,34)
List.combine l1 l2
AppG (fromList [VarG])

*)
