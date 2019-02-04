
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let digit =
        match x with
        | (f,g)::t ->
            if ((f + g) + carry) > 9
            then (1, (((f + g) + (carry mod 10)) :: t))
            else (0, (((f + g) + (carry mod 10)) :: t)) in
      digit in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> (f + g) + (carry mod 10) in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,6)-(23,11)
EMPTY
EmptyG

(18,8)-(22,55)
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,14)-(18,15)
match x with
| (f , g) -> if ((f + g) + carry) > 9
             then 1
             else 0
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(21,17)-(21,55)
EMPTY
EmptyG

(21,21)-(21,54)
0
LitG

(21,22)-(21,48)
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(21,52)-(21,53)
match a with
| (o , p) -> (newc , digit :: p)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(22,17)-(22,55)
a
VarG

(22,18)-(22,19)
newc
VarG

(22,22)-(22,48)
EMPTY
EmptyG

(22,23)-(22,30)
EMPTY
EmptyG

(22,24)-(22,25)
EMPTY
EmptyG

(22,28)-(22,29)
EMPTY
EmptyG

(22,33)-(22,47)
EMPTY
EmptyG

(22,34)-(22,39)
EMPTY
EmptyG

(22,44)-(22,46)
EMPTY
EmptyG

(22,52)-(22,53)
EMPTY
EmptyG

(24,4)-(26,51)
p
VarG

*)
