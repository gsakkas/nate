
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
      match x with
      | (b,c) -> if (b + c) > 9 then (((b + c) - 10), 1) else ((b + c), 0) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
(19,7)-(20,75)
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
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(22,16)-(22,45)
List.rev (List.combine l1
                       l2) @ [(0 , 0)]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(18,5)-(23,52)
(18,11)-(20,75)
(18,13)-(20,75)
(19,7)-(20,75)
(20,18)-(20,75)
(20,63)-(20,75)
(20,73)-(20,74)
(21,5)-(23,52)
(21,16)-(21,23)
(21,20)-(21,22)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
*)
