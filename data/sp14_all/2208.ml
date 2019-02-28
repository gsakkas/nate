
let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else if i = 1 then l else bigAdd ((bigAdd l l) (mulByDigit (i - 2) l));;


(* fix

let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else if i = 1 then l else bigAdd (bigAdd l l) (mulByDigit (i - 2) l);;

*)

(* changed spans
(29,28)-(29,72)
bigAdd (bigAdd l l)
       (mulByDigit (i - 2) l)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (29,28)-(29,70)) (Var (Just (29,28)-(29,34)) "bigAdd") [App (Just (29,35)-(29,47)) (Var (Just (29,36)-(29,42)) "bigAdd") [Var (Just (29,43)-(29,44)) "l",Var (Just (29,45)-(29,46)) "l"],App (Just (29,48)-(29,70)) (Var (Just (29,49)-(29,59)) "mulByDigit") [Bop (Just (29,60)-(29,67)) Minus (Var (Just (29,61)-(29,62)) "i") (Lit (Just (29,65)-(29,66)) (LI 2)),Var (Just (29,68)-(29,69)) "l"]]
*)

(* typed spans
(29,28)-(29,70)
*)

(* correct types
int list
*)

(* bad types
int list -> int list
*)
