
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
      | (z,y)::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + z) <= 9 -> (0, ((x1 + x2) + z)) :: a
           | (x1,x2) when ((x1 + x2) + z) > 9 -> (1, (((x1 + x2) + z) - 9))
               :: a) in
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
(20,6)-(29,20)
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
10
LitG

(24,60)-(24,61)
EMPTY
EmptyG

(24,67)-(24,68)
EMPTY
EmptyG

(26,10)-(29,20)
EMPTY
EmptyG

(26,17)-(26,18)
sum / 10
BopG VarG LitG

(27,26)-(27,41)
(h + (sum mod 10)) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG VarG (BopG VarG LitG)]))) Nothing

(27,50)-(27,70)
EMPTY
EmptyG

(27,51)-(27,52)
EMPTY
EmptyG

(27,54)-(27,69)
EMPTY
EmptyG

(27,55)-(27,64)
EMPTY
EmptyG

(27,56)-(27,58)
EMPTY
EmptyG

(27,61)-(27,63)
EMPTY
EmptyG

(27,67)-(27,68)
sum mod 10
BopG VarG LitG

(28,26)-(28,45)
sum mod 10
BopG VarG LitG

(28,49)-(28,75)
EMPTY
EmptyG

(28,50)-(28,51)
EMPTY
EmptyG

(28,53)-(28,74)
EMPTY
EmptyG

(28,54)-(28,69)
sum / 10
BopG VarG LitG

(28,56)-(28,58)
EMPTY
EmptyG

(28,61)-(28,63)
EMPTY
EmptyG

(28,67)-(28,68)
EMPTY
EmptyG

(28,72)-(28,73)
EMPTY
EmptyG

(29,18)-(29,19)
h
VarG

(32,4)-(32,51)
EMPTY
EmptyG

(32,48)-(32,51)
EMPTY
EmptyG

*)
