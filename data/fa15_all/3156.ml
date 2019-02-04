
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = x in
      let b::b' = y in let c::c' = z in ([b + c], ([b + c] @ a)) in
    let base = [] in
    let args = padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,45)-(3,48)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(3,45)-(3,68)
EMPTY
EmptyG

(3,49)-(3,50)
EMPTY
EmptyG

(5,6)-(5,11)
EMPTY
EmptyG

(5,10)-(5,11)
EMPTY
EmptyG

(25,6)-(26,64)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(26,6)-(26,64)
EMPTY
EmptyG

(26,18)-(26,19)
EMPTY
EmptyG

(26,23)-(26,64)
EMPTY
EmptyG

(26,35)-(26,36)
EMPTY
EmptyG

(26,42)-(26,43)
EMPTY
EmptyG

(26,46)-(26,47)
EMPTY
EmptyG

(26,50)-(26,63)
EMPTY
EmptyG

(26,51)-(26,58)
x2
VarG

(26,52)-(26,53)
EMPTY
EmptyG

(26,52)-(26,57)
EMPTY
EmptyG

(26,56)-(26,57)
EMPTY
EmptyG

(26,59)-(26,60)
x1
VarG

(26,61)-(26,62)
x2
VarG

(27,15)-(27,17)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(28,4)-(29,51)
[]
ListG EmptyG Nothing

(28,15)-(28,22)
List.combine
VarG

*)
