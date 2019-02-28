
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
      match a with
      | h::t -> ((h + z) / 10) :: ((h + z) mod 10) :: t
      | _ -> (z / 10) :: (z mod 10) in
    let base = [] in
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
(20,6)-(22,35)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(23,15)-(23,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Case (Just (20,6)-(20,71)) (Var (Just (20,12)-(20,13)) "a") [(TuplePat (Just (20,22)-(20,25)) [VarPat (Just (20,22)-(20,23)) "w",VarPat (Just (20,24)-(20,25)) "y"],Nothing,Tuple (Just (20,30)-(20,71)) [Bop (Just (20,31)-(20,45)) Div (Bop (Just (20,32)-(20,39)) Plus (Var (Just (20,33)-(20,34)) "w") (Var (Just (20,37)-(20,38)) "z")) (Lit (Just (20,42)-(20,44)) (LI 10)),ConApp (Just (20,47)-(20,70)) "::" (Just (Tuple (Just (20,48)-(20,69)) [Bop (Just (20,48)-(20,64)) Mod (Bop (Just (20,49)-(20,56)) Plus (Var (Just (20,50)-(20,51)) "w") (Var (Just (20,54)-(20,55)) "z")) (Lit (Just (20,61)-(20,63)) (LI 10)),Var (Just (20,68)-(20,69)) "y"])) Nothing])]
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
*)

(* typed spans
(20,6)-(20,71)
(21,15)-(21,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
int list
int list
*)
