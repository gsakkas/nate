
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1) (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,28)-(28,57)
List.rev
VarG

(28,28)-(28,57)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
Var (Just (28,15)-(28,23)) "List.rev"
App (Just (28,24)-(28,58)) (Var (Just (28,25)-(28,37)) "List.combine") [ConApp (Just (28,38)-(28,47)) "::" (Just (Tuple (Just (28,39)-(28,46)) [Lit (Just (28,39)-(28,40)) (LI 0),Var (Just (28,44)-(28,46)) "l1"])) Nothing,ConApp (Just (28,48)-(28,57)) "::" (Just (Tuple (Just (28,49)-(28,56)) [Lit (Just (28,49)-(28,50)) (LI 0),Var (Just (28,54)-(28,56)) "l2"])) Nothing]
*)

(* typed spans
(28,15)-(28,23)
(28,24)-(28,58)
*)

(* correct types
(int * int) list -> (int * int) list
(int * int) list
*)

(* bad types
'a list
'a list
*)
