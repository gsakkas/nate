
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + (((fst x) + (snd x)) mod 10) in
    let base = 0 in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst a) + (((fst x) + (snd x)) mod 10) in
      ((sum / 10), (sum mod 10)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in [res] in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,48)
let sum =
  fst a + ((fst x + snd x) mod 10) in
(sum / 10 , sum mod 10)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(19,15)-(19,16)
(0 , 0)
TupleG (fromList [LitG])

(20,4)-(21,51)
0
LitG

(21,48)-(21,51)
[res]
ListG VarG

*)

(* changed exprs
Let (Just (19,6)-(20,32)) NonRec [(VarPat (Just (19,10)-(19,13)) "sum",Bop (Just (19,16)-(19,54)) Plus (App (Just (19,16)-(19,23)) (Var (Just (19,17)-(19,20)) "fst") [Var (Just (19,21)-(19,22)) "a"]) (Bop (Just (19,26)-(19,54)) Mod (Bop (Just (19,27)-(19,46)) Plus (App (Just (19,28)-(19,35)) (Var (Just (19,29)-(19,32)) "fst") [Var (Just (19,33)-(19,34)) "x"]) (App (Just (19,38)-(19,45)) (Var (Just (19,39)-(19,42)) "snd") [Var (Just (19,43)-(19,44)) "x"])) (Lit (Just (19,51)-(19,53)) (LI 10))))] (Tuple (Just (20,6)-(20,32)) [Bop (Just (20,7)-(20,17)) Div (Var (Just (20,8)-(20,11)) "sum") (Lit (Just (20,14)-(20,16)) (LI 10)),Bop (Just (20,19)-(20,31)) Mod (Var (Just (20,20)-(20,23)) "sum") (Lit (Just (20,28)-(20,30)) (LI 10))])
Tuple (Just (21,15)-(21,21)) [Lit (Just (21,16)-(21,17)) (LI 0),Lit (Just (21,19)-(21,20)) (LI 0)]
Lit (Just (21,19)-(21,20)) (LI 0)
List (Just (23,48)-(23,53)) [Var (Just (23,49)-(23,52)) "res"] Nothing
*)

(* typed spans
(19,6)-(20,32)
(21,15)-(21,21)
(21,19)-(21,20)
(23,48)-(23,53)
*)

(* correct types
(int * int)
(int * int)
int
int list
*)

(* bad types
int
int
int list
int list
*)
