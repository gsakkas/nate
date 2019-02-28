
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in x1 + x2 in
    let base = [(0, 0)] List.combine l1 l2 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,35)-(17,42)
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(18,15)-(18,42)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(18,15)-(18,42)
0
LitG

(18,15)-(18,42)
[]
ListG EmptyG

*)

(* changed exprs
Let (Just (19,6)-(20,73)) NonRec [(TuplePat (Just (19,11)-(19,20)) [VarPat (Just (19,11)-(19,16)) "carry",VarPat (Just (19,17)-(19,20)) "res"],Var (Just (19,24)-(19,25)) "a")] (Tuple (Just (20,6)-(20,73)) [Bop (Just (20,7)-(20,33)) Div (Bop (Just (20,8)-(20,27)) Plus (Bop (Just (20,9)-(20,18)) Plus (Var (Just (20,10)-(20,12)) "x1") (Var (Just (20,15)-(20,17)) "x2")) (Var (Just (20,21)-(20,26)) "carry")) (Lit (Just (20,30)-(20,32)) (LI 10)),ConApp (Just (20,35)-(20,72)) "::" (Just (Tuple (Just (20,36)-(20,71)) [Bop (Just (20,36)-(20,64)) Mod (Bop (Just (20,37)-(20,56)) Plus (Bop (Just (20,38)-(20,47)) Plus (Var (Just (20,39)-(20,41)) "x1") (Var (Just (20,44)-(20,46)) "x2")) (Var (Just (20,50)-(20,55)) "carry")) (Lit (Just (20,61)-(20,63)) (LI 10)),Var (Just (20,68)-(20,71)) "res"])) Nothing])
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
Lit (Just (21,16)-(21,17)) (LI 0)
List (Just (21,19)-(21,21)) [] Nothing
*)

(* typed spans
(19,6)-(20,73)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
*)

(* correct types
(int * int list)
(int * int list)
int
int list
*)

(* bad types
int
int
int
int
*)
