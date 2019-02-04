
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
      let v = (x1 + x2) + c' in
      (([c + 1] @ [v / 10]), (s' @ ([s + c'] @ [v mod 10]))) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;


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

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

*)

(* changed spans
(5,6)-(5,11)
EMPTY
EmptyG

(5,10)-(5,11)
EMPTY
EmptyG

(17,11)-(29,21)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(21,6)-(25,60)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,6)-(25,60)
EMPTY
EmptyG

(22,23)-(22,25)
EMPTY
EmptyG

(23,6)-(25,60)
EMPTY
EmptyG

(23,18)-(23,20)
EMPTY
EmptyG

(24,26)-(24,28)
c
VarG

(25,7)-(25,27)
v / 10
BopG VarG LitG

(25,9)-(25,10)
EMPTY
EmptyG

(25,9)-(25,14)
EMPTY
EmptyG

(25,13)-(25,14)
EMPTY
EmptyG

(25,18)-(25,26)
EMPTY
EmptyG

(25,30)-(25,32)
EMPTY
EmptyG

(25,35)-(25,58)
EMPTY
EmptyG

(25,37)-(25,38)
EMPTY
EmptyG

(25,37)-(25,43)
EMPTY
EmptyG

(25,41)-(25,43)
EMPTY
EmptyG

(25,45)-(25,46)
EMPTY
EmptyG

(25,47)-(25,57)
EMPTY
EmptyG

(26,4)-(28,60)
a2
VarG

(26,16)-(26,22)
EMPTY
EmptyG

(26,20)-(26,21)
EMPTY
EmptyG

(26,25)-(26,26)
0
LitG

(27,15)-(27,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(28,4)-(28,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(28,50)-(28,60)
EMPTY
EmptyG

(28,51)-(28,54)
EMPTY
EmptyG

(29,2)-(29,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(32,2)-(32,72)
if i < 1
then []
else (match i with
      | 1 -> l
      | _ -> bigAdd l
                    (mulByDigit (i - 1) l))
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(32,8)-(32,9)
i < 1
BopG VarG LitG

(32,22)-(32,24)
1
LitG

(32,32)-(32,33)
match i with
| 1 -> l
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)
