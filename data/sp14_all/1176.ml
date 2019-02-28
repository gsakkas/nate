
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

let rec removeZero l =
  match l with | [] -> l | x::l' -> if x = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sumInit = (x1 + x2) + carry in
      let carry2 = sumInit / 10 in
      let dig = sumInit mod 10 in
      match a with | [] -> [carry2; dig] | h::t -> carry2 :: dig :: t in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l1 in
  let length2 = List.fold_left (fun acc  -> fun x  -> acc + 1) 0 l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, (List.append (clone 0 (length1 - length2)) l2));;

let rec removeZero l =
  match l with | [] -> l | x::l' -> if x = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sumInit = (x1 + x2) + carry in
      let carry2 = sumInit / 10 in
      let dig = sumInit mod 10 in
      match a with | (x,y) -> (carry2, (dig :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,6)-(25,69)
match a with
| (x , y) -> (carry2 , dig :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (25,6)-(25,50)) (Var (Just (25,12)-(25,13)) "a") [(TuplePat (Just (25,22)-(25,25)) [VarPat (Just (25,22)-(25,23)) "x",VarPat (Just (25,24)-(25,25)) "y"],Nothing,Tuple (Just (25,30)-(25,50)) [Var (Just (25,31)-(25,37)) "carry2",ConApp (Just (25,39)-(25,49)) "::" (Just (Tuple (Just (25,40)-(25,48)) [Var (Just (25,40)-(25,43)) "dig",Var (Just (25,47)-(25,48)) "y"])) Nothing])]
*)

(* typed spans
(25,6)-(25,50)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
