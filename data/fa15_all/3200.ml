
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), (s @ [v mod 10])) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;


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
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,6)-(5,11)
EMPTY
EmptyG

(5,10)-(5,11)
EMPTY
EmptyG

(17,11)-(28,21)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(21,6)-(24,72)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,6)-(24,72)
EMPTY
EmptyG

(22,23)-(22,25)
EMPTY
EmptyG

(23,6)-(24,72)
EMPTY
EmptyG

(23,18)-(23,20)
EMPTY
EmptyG

(24,26)-(24,28)
c
VarG

(24,33)-(24,53)
v / 10
BopG VarG LitG

(24,35)-(24,36)
EMPTY
EmptyG

(24,35)-(24,40)
EMPTY
EmptyG

(24,39)-(24,40)
EMPTY
EmptyG

(24,44)-(24,52)
EMPTY
EmptyG

(24,56)-(24,57)
EMPTY
EmptyG

(25,4)-(27,60)
a2
VarG

(25,16)-(25,22)
EMPTY
EmptyG

(25,20)-(25,21)
EMPTY
EmptyG

(25,25)-(25,26)
0
LitG

(26,15)-(26,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(27,4)-(27,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(27,50)-(27,60)
EMPTY
EmptyG

(27,51)-(27,54)
EMPTY
EmptyG

(28,2)-(28,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
