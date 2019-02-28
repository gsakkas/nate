
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: ((h + c) mod 10) :: t
      | _ -> [c / 10; c mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let t1 = List.nth l1 (List.length l1) in
      let t2 = List.nth l2 (List.length l2) in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(19,31)
EMPTY
EmptyG

(16,14)-(16,21)
List.nth l1 (List.length l1)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(16,14)-(16,31)
let t1 =
  List.nth l1
           (List.length l1) in
let t2 =
  List.nth l2
           (List.length l2) in
if (t1 + t2) > 9
then (1 , [(t1 + t2) - 10])
else (0 , [t1 + t2])
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,15)-(16,18)
EMPTY
EmptyG

(16,19)-(16,20)
List.length
VarG

(16,24)-(16,31)
let t2 =
  List.nth l2
           (List.length l2) in
if (t1 + t2) > 9
then (1 , [(t1 + t2) - 10])
else (0 , [t1 + t2])
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(16,25)-(16,28)
EMPTY
EmptyG

(16,29)-(16,30)
EMPTY
EmptyG

(17,6)-(19,31)
EMPTY
EmptyG

(17,12)-(17,13)
EMPTY
EmptyG

(18,16)-(18,30)
List.length
VarG

(18,16)-(18,55)
EMPTY
EmptyG

(18,17)-(18,24)
if (t1 + t2) > 9
then (1 , [(t1 + t2) - 10])
else (0 , [t1 + t2])
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(18,18)-(18,19)
EMPTY
EmptyG

(18,22)-(18,23)
EMPTY
EmptyG

(18,27)-(18,29)
EMPTY
EmptyG

(18,34)-(18,50)
t1
VarG

(18,34)-(18,55)
EMPTY
EmptyG

(18,35)-(18,42)
(1 , [(t1 + t2) - 10])
TupleG (fromList [LitG,ListG EmptyG])

(18,36)-(18,37)
EMPTY
EmptyG

(18,40)-(18,41)
EMPTY
EmptyG

(18,47)-(18,49)
EMPTY
EmptyG

(18,54)-(18,55)
EMPTY
EmptyG

(19,13)-(19,31)
EMPTY
EmptyG

(19,14)-(19,15)
EMPTY
EmptyG

(19,14)-(19,20)
EMPTY
EmptyG

(19,18)-(19,20)
EMPTY
EmptyG

(19,22)-(19,23)
t1
VarG

(19,22)-(19,30)
EMPTY
EmptyG

(19,28)-(19,30)
t2
VarG

(20,4)-(22,51)
(0 , [t1 + t2])
TupleG (fromList [LitG,ListG EmptyG])

(20,15)-(20,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* typed spans
int
(int * int list)
int list -> int
(int * int list)
int list -> int
(int * int list)
int
(int * int list)
int
int
(int * int list)
(int * int list)
*)
