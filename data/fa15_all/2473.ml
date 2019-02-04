
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((out,sum),[]) -> (0, sum)
      | ((out,sum),(b,c)::l') ->
          let d = (b + c) + out in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, ([carry] @ [(carry + b) + c]))
                    else
                      ((carry + 1),
                        ([carry + 1] @ [((carry + b) + c) mod 10]))
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(22,68)
EMPTY
EmptyG

(18,12)-(18,18)
EMPTY
EmptyG

(18,13)-(18,14)
match x with
| (b , c) -> match a with
             | (carry , sum) -> match sum with
                                | [] -> if ((carry + b) + c) < 10
                                        then (0 , [carry] @ [(carry + b) + c])
                                        else (carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
                                | h :: t -> if ((b + c) + h) < 10
                                            then (0 , [0] @ ([(b + c) + h] @ t))
                                            else (carry + 1 , [((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(19,26)-(19,34)
match a with
| (carry , sum) -> match sum with
                   | [] -> if ((carry + b) + c) < 10
                           then (0 , [carry] @ [(carry + b) + c])
                           else (carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
                   | h :: t -> if ((b + c) + h) < 10
                               then (0 , [0] @ ([(b + c) + h] @ t))
                               else (carry + 1 , [((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(19,30)-(19,33)
EMPTY
EmptyG

(21,10)-(22,68)
[carry] @ [(carry + b) + c]
AppG (fromList [ListG EmptyG Nothing])

(21,18)-(21,31)
[(carry + b) + c]
ListG (BopG EmptyG EmptyG) Nothing

(21,19)-(21,20)
carry
VarG

(21,28)-(21,31)
(carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(22,10)-(22,68)
[carry + 1] @ [((carry + b) + c) mod 10]
AppG (fromList [ListG EmptyG Nothing])

(22,13)-(22,14)
(b + c) + h
BopG (BopG EmptyG EmptyG) VarG

(22,17)-(22,19)
b + c
BopG VarG VarG

(22,29)-(22,39)
EMPTY
EmptyG

(22,30)-(22,31)
EMPTY
EmptyG

(22,35)-(22,38)
[0] @ ([(b + c) + h] @ t)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(22,46)-(22,68)
[(b + c) + h] @ t
AppG (fromList [VarG,ListG EmptyG Nothing])

(22,47)-(22,48)
carry + 1
BopG VarG LitG

(22,50)-(22,67)
EMPTY
EmptyG

(22,51)-(22,59)
EMPTY
EmptyG

(22,52)-(22,53)
[((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(22,56)-(22,58)
[((h + b) + c) / 10]
ListG (BopG EmptyG EmptyG) Nothing

(22,63)-(22,66)
[((h + b) + c) mod 10] @ t
AppG (fromList [VarG,ListG EmptyG Nothing])

(23,4)-(25,51)
[((h + b) + c) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
