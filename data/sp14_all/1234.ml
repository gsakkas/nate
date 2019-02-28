
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "TBD" in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,30)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,19)-(19,20)
[]
ListG EmptyG

*)

(* changed exprs
Let (Just (19,6)-(20,71)) NonRec [(VarPat (Just (19,10)-(19,11)) "z",Bop (Just (19,14)-(19,31)) Plus (App (Just (19,14)-(19,21)) (Var (Just (19,15)-(19,18)) "fst") [Var (Just (19,19)-(19,20)) "x"]) (App (Just (19,24)-(19,31)) (Var (Just (19,25)-(19,28)) "snd") [Var (Just (19,29)-(19,30)) "x"]))] (Case (Just (20,6)-(20,71)) (Var (Just (20,12)-(20,13)) "a") [(TuplePat (Just (20,22)-(20,25)) [VarPat (Just (20,22)-(20,23)) "w",VarPat (Just (20,24)-(20,25)) "y"],Nothing,Tuple (Just (20,30)-(20,71)) [Bop (Just (20,31)-(20,45)) Div (Bop (Just (20,32)-(20,39)) Plus (Var (Just (20,33)-(20,34)) "w") (Var (Just (20,37)-(20,38)) "z")) (Lit (Just (20,42)-(20,44)) (LI 10)),ConApp (Just (20,47)-(20,70)) "::" (Just (Tuple (Just (20,48)-(20,69)) [Bop (Just (20,48)-(20,64)) Mod (Bop (Just (20,49)-(20,56)) Plus (Var (Just (20,50)-(20,51)) "w") (Var (Just (20,54)-(20,55)) "z")) (Lit (Just (20,61)-(20,63)) (LI 10)),Var (Just (20,68)-(20,69)) "y"])) Nothing])])
List (Just (21,19)-(21,21)) [] Nothing
*)

(* typed spans
(19,6)-(20,71)
(21,19)-(21,21)
*)

(* correct types
(int * int list)
int list
*)

(* bad types
(int * int)
int
*)
