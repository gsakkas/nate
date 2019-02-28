
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> [] | h::t -> (0, ((x + h) :: a)) in
    let base = [] in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,16)-(17,70)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(18,15)-(18,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(19,15)-(19,17)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Let (Just (18,6)-(21,44)) NonRec [(VarPat (Just (18,10)-(18,13)) "sum",Bop (Just (18,16)-(18,33)) Plus (App (Just (18,16)-(18,23)) (Var (Just (18,17)-(18,20)) "fst") [Var (Just (18,21)-(18,22)) "x"]) (App (Just (18,26)-(18,33)) (Var (Just (18,27)-(18,30)) "snd") [Var (Just (18,31)-(18,32)) "x"]))] (Ite (Just (19,6)-(21,44)) (Bop (Just (19,9)-(19,16)) Gt (Var (Just (19,9)-(19,12)) "sum") (Lit (Just (19,15)-(19,16)) (LI 9))) (Tuple (Just (20,11)-(20,51)) [Lit (Just (20,12)-(20,13)) (LI 1),ConApp (Just (20,15)-(20,50)) "::" (Just (Tuple (Just (20,16)-(20,49)) [Bop (Just (20,16)-(20,38)) Plus (Bop (Just (20,17)-(20,27)) Minus (Var (Just (20,18)-(20,21)) "sum") (Lit (Just (20,24)-(20,26)) (LI 10))) (App (Just (20,30)-(20,37)) (Var (Just (20,31)-(20,34)) "fst") [Var (Just (20,35)-(20,36)) "a"]),App (Just (20,42)-(20,49)) (Var (Just (20,43)-(20,46)) "snd") [Var (Just (20,47)-(20,48)) "a"]])) Nothing]) (Tuple (Just (21,11)-(21,44)) [Lit (Just (21,12)-(21,13)) (LI 0),ConApp (Just (21,15)-(21,43)) "::" (Just (Tuple (Just (21,16)-(21,42)) [Bop (Just (21,16)-(21,31)) Plus (Var (Just (21,17)-(21,20)) "sum") (App (Just (21,23)-(21,30)) (Var (Just (21,24)-(21,27)) "fst") [Var (Just (21,28)-(21,29)) "a"]),App (Just (21,35)-(21,42)) (Var (Just (21,36)-(21,39)) "snd") [Var (Just (21,40)-(21,41)) "a"]])) Nothing]))
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
App (Just (23,15)-(23,33)) (Var (Just (23,15)-(23,27)) "List.combine") [Var (Just (23,28)-(23,30)) "l1",Var (Just (23,31)-(23,33)) "l2"]
*)

(* typed spans
(18,6)-(21,44)
(22,15)-(22,22)
(23,15)-(23,33)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list
*)

(* bad types
int list
int list
int list
*)
