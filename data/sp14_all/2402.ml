
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
      | _ -> [carry / 10; carry mod 10] in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,18)-(15,25)
EMPTY
EmptyG

(15,18)-(15,35)
EMPTY
EmptyG

(15,19)-(15,22)
match a with
| (x , y) -> x
CaseG VarG (fromList [(Nothing,VarG)])

(15,23)-(15,24)
a
VarG

(15,28)-(15,35)
EMPTY
EmptyG

(15,29)-(15,32)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(16,6)-(18,39)
EMPTY
EmptyG

(16,12)-(16,13)
EMPTY
EmptyG

(17,16)-(17,63)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,18)-(17,19)
EMPTY
EmptyG

(17,22)-(17,27)
EMPTY
EmptyG

(17,31)-(17,33)
EMPTY
EmptyG

(17,38)-(17,58)
EMPTY
EmptyG

(17,38)-(17,63)
EMPTY
EmptyG

(17,40)-(17,41)
EMPTY
EmptyG

(17,55)-(17,57)
EMPTY
EmptyG

(17,62)-(17,63)
EMPTY
EmptyG

(18,13)-(18,39)
EMPTY
EmptyG

(18,14)-(18,19)
addend_a
VarG

(18,14)-(18,24)
EMPTY
EmptyG

(18,22)-(18,24)
addend_b
VarG

(18,26)-(18,31)
(carry + addend_a) + addend_b
BopG (BopG EmptyG EmptyG) VarG

(18,26)-(18,38)
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,36)-(18,38)
addend_b
VarG

(19,4)-(21,51)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)
