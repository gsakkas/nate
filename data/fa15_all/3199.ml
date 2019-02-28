
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
      let c::c' = a1 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), [v mod 10]) in
    let base = ([0], [5]) in
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

(17,11)-(27,21)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(21,6)-(23,66)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,6)-(23,66)
EMPTY
EmptyG

(23,26)-(23,28)
c
VarG

(23,33)-(23,53)
v / 10
BopG VarG LitG

(23,35)-(23,40)
EMPTY
EmptyG

(23,55)-(23,65)
[v mod 10] @ a2
AppG (fromList [VarG,ListG EmptyG])

(24,4)-(26,60)
a2
VarG

(24,16)-(24,19)
EMPTY
EmptyG

(24,22)-(24,23)
0
LitG

(25,15)-(25,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(26,4)-(26,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(26,50)-(26,60)
EMPTY
EmptyG

(27,2)-(27,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* typed spans
(15,19)-(18,66)
(24,6)-(25,73)
(25,26)-(25,27)
(25,32)-(25,40)
(25,54)-(25,71)
(25,68)-(25,70)
(26,20)-(26,21)
(27,15)-(27,44)
(28,4)-(28,51)
(29,13)-(29,34)
*)

(* typed spans
int list -> int list
(int * int list)
int
int
int list
int list
int
(int * int) list
int list
int list
*)

(* typed spans
int list -> int list -> (int list * int list)
(int list * int list)
int list
int list
int list
(int list * int list)
int
(int * int) list
(int list * int list)
(int list * int list) -> (int list * int list)
*)
