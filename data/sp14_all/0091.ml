
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | [] -> [] in
    let base = ([], []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,39)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(17,16)-(17,18)
0
LitG

*)

(* changed exprs
Case (Just (17,6)-(21,23)) (App (Just (17,12)-(17,17)) (Var (Just (17,12)-(17,15)) "snd") [Var (Just (17,16)-(17,17)) "a"]) [(ConPat (Just (18,8)-(18,10)) "[]" Nothing,Nothing,Tuple (Just (19,10)-(20,67)) [Bop (Just (19,11)-(19,30)) Plus (App (Just (19,12)-(19,19)) (Var (Just (19,13)-(19,16)) "fst") [Var (Just (19,17)-(19,18)) "x"]) (App (Just (19,22)-(19,29)) (Var (Just (19,23)-(19,26)) "snd") [Var (Just (19,27)-(19,28)) "x"]),List (Just (20,12)-(20,66)) [Bop (Just (20,13)-(20,37)) Div (Bop (Just (20,13)-(20,32)) Plus (App (Just (20,14)-(20,21)) (Var (Just (20,15)-(20,18)) "fst") [Var (Just (20,19)-(20,20)) "x"]) (App (Just (20,24)-(20,31)) (Var (Just (20,25)-(20,28)) "snd") [Var (Just (20,29)-(20,30)) "x"])) (Lit (Just (20,35)-(20,37)) (LI 10)),Bop (Just (20,39)-(20,65)) Mod (Bop (Just (20,39)-(20,58)) Plus (App (Just (20,40)-(20,47)) (Var (Just (20,41)-(20,44)) "fst") [Var (Just (20,45)-(20,46)) "x"]) (App (Just (20,50)-(20,57)) (Var (Just (20,51)-(20,54)) "snd") [Var (Just (20,55)-(20,56)) "x"])) (Lit (Just (20,63)-(20,65)) (LI 10))] Nothing]),(ConsPat (Just (21,8)-(21,12)) (VarPat (Just (21,8)-(21,9)) "h") (VarPat (Just (21,11)-(21,12)) "t"),Nothing,Tuple (Just (21,16)-(21,23)) [Lit (Just (21,17)-(21,18)) (LI 0),List (Just (21,20)-(21,22)) [] Nothing])]
Lit (Just (22,16)-(22,17)) (LI 0)
*)

(* typed spans
(17,6)-(21,23)
(22,16)-(22,17)
*)

(* correct types
(int * int list)
int
*)

(* bad types
'a list
'a list
*)
