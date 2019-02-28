
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: ((h + c) mod 10) :: t
      | _ -> [c / 10; c mod 10] in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(21,31)
let (x1 , x2) = x in
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,6)-(21,31)
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(19,12)-(19,13)
x2
VarG

(20,16)-(20,55)
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

(20,18)-(20,19)
x1
VarG

(20,36)-(20,37)
a1 + x1
BopG VarG VarG

(21,13)-(21,31)
x2
VarG

(21,14)-(21,20)
a2
VarG

(21,28)-(21,30)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(22,19)-(22,20)
[]
ListG EmptyG

*)

(* typed spans
(18,6)-(20,59)
(19,6)-(20,59)
(20,14)-(20,16)
(20,6)-(20,59)
(20,9)-(20,11)
(20,28)-(20,37)
(20,40)-(20,42)
(20,55)-(20,57)
(22,15)-(22,44)
(21,19)-(21,21)
*)

(* typed spans
(int * int list)
(int * int list)
int
(int * int list)
int
int
int
int list
(int * int) list
int list
*)

(* typed spans
int list
int list
int list
int list
int
int
int list
int
int
int
*)
