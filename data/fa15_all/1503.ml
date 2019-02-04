
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> (0, (x1 + x2)) :: a
           | (x1,x2) when (x1 + x2) > 9 -> (1, ((x1 + x2) - 9)) :: a)
      | (h1::t1,h2::t2) ->
          (match x with
           | (x1,x2) when ((x1 + x2) + h1) <= 9 -> (0, ((x1 + x2) + h1)) ::
               h2 :: t2
           | (x1,x2) when ((x1 + x2) + h1) > 9 -> (1, (((x1 + x2) + h1) - 9))
               :: h2 :: t2) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(30,27)
EMPTY
EmptyG

(20,12)-(20,13)
EMPTY
EmptyG

(22,10)-(24,69)
EMPTY
EmptyG

(22,17)-(22,18)
EMPTY
EmptyG

(23,32)-(23,34)
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG (BopG VarG LitG)]))) Nothing]))) Nothing),(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing)])

(23,44)-(23,58)
EMPTY
EmptyG

(23,44)-(23,63)
EMPTY
EmptyG

(23,45)-(23,46)
let sum = fst x + snd x in
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(23,49)-(23,51)
EMPTY
EmptyG

(23,54)-(23,56)
fst x
AppG (fromList [VarG])

(24,43)-(24,63)
EMPTY
EmptyG

(24,44)-(24,45)
EMPTY
EmptyG

(24,47)-(24,62)
EMPTY
EmptyG

(24,48)-(24,57)
EMPTY
EmptyG

(24,49)-(24,51)
EMPTY
EmptyG

(24,54)-(24,56)
a
VarG

(24,60)-(24,61)
EMPTY
EmptyG

(24,67)-(24,68)
EMPTY
EmptyG

(26,10)-(30,27)
10
LitG

(26,17)-(26,18)
sum / 10
BopG VarG LitG

(27,51)-(27,72)
EMPTY
EmptyG

(27,52)-(27,53)
EMPTY
EmptyG

(27,55)-(27,71)
EMPTY
EmptyG

(27,56)-(27,65)
EMPTY
EmptyG

(27,57)-(27,59)
EMPTY
EmptyG

(27,62)-(27,64)
EMPTY
EmptyG

(27,68)-(27,70)
sum mod 10
BopG VarG LitG

(28,15)-(28,17)
EMPTY
EmptyG

(28,21)-(28,23)
sum / 10
BopG VarG LitG

(29,33)-(29,35)
sum mod 10
BopG VarG LitG

(29,50)-(29,77)
EMPTY
EmptyG

(29,51)-(29,52)
EMPTY
EmptyG

(29,54)-(29,76)
EMPTY
EmptyG

(29,56)-(29,65)
EMPTY
EmptyG

(29,57)-(29,59)
EMPTY
EmptyG

(29,62)-(29,64)
EMPTY
EmptyG

(29,68)-(29,70)
EMPTY
EmptyG

(29,74)-(29,75)
EMPTY
EmptyG

(30,18)-(30,20)
EMPTY
EmptyG

(30,18)-(30,26)
EMPTY
EmptyG

(30,24)-(30,26)
h
VarG

(33,4)-(33,51)
EMPTY
EmptyG

(33,48)-(33,51)
EMPTY
EmptyG

*)
