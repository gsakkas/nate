
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (x, a) with
      | ((fst,sec),_) ->
          if (fst + sec) > 9
          then (((fst + sec) - 10), 1)
          else ((fst + sec), 0)
      | ((fst,sec),(carry,digits)) ->
          if sec = 1
          then (1, (digits @ (fst, sec)))
          else (0, (digits @ (fst, sec))) in
    let base = (0, []) in
    let args = [(0, 0)] @ (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(27,41)
EMPTY
EmptyG

(19,12)-(19,18)
let (fst , sec) = x in
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,16)-(19,17)
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(25,10)-(27,41)
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(25,13)-(25,16)
sec'
VarG

(26,29)-(26,39)
EMPTY
EmptyG

(26,30)-(26,33)
EMPTY
EmptyG

(26,35)-(26,38)
[fst']
ListG VarG Nothing

(27,15)-(27,41)
fst'
VarG

(27,29)-(27,39)
[fst']
ListG VarG Nothing

(27,30)-(27,33)
EMPTY
EmptyG

(27,35)-(27,38)
carry'
VarG

(28,4)-(30,51)
digits'
VarG

(29,15)-(29,23)
EMPTY
EmptyG

(29,16)-(29,22)
EMPTY
EmptyG

(29,17)-(29,18)
EMPTY
EmptyG

(29,20)-(29,21)
EMPTY
EmptyG

(30,4)-(30,51)
[(0 , 0)]
ListG (TupleG (fromList [EmptyG])) Nothing

*)
