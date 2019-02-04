
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with | _ -> [a mod 10] | h::t -> ((a + h) mod 10) :: t in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(16,68)
EMPTY
EmptyG

(16,12)-(16,13)
EMPTY
EmptyG

(16,26)-(16,36)
EMPTY
EmptyG

(16,27)-(16,28)
match a with
| (x , y) -> x
CaseG VarG (fromList [(Nothing,VarG)])

(16,27)-(16,35)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,33)-(16,35)
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(16,47)-(16,68)
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,49)-(16,50)
EMPTY
EmptyG

(16,53)-(16,54)
carry + add1
BopG VarG VarG

(16,60)-(16,62)
add2
VarG

(16,67)-(16,68)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(17,4)-(19,51)
(new_carry , digit :: y)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(17,15)-(17,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,15)-(18,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
