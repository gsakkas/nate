
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (_,_) -> carry :: rest
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,10)-(22,61)
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (18,10)-(21,61)) (Var (Just (18,17)-(18,18)) "x") [(TuplePat (Just (19,14)-(19,23)) [VarPat (Just (19,14)-(19,18)) "add1",VarPat (Just (19,19)-(19,23)) "add2"],Nothing,Tuple (Just (20,15)-(21,60)) [Bop (Just (20,16)-(20,46)) Div (Bop (Just (20,17)-(20,40)) Plus (Bop (Just (20,18)-(20,31)) Plus (Var (Just (20,19)-(20,23)) "add1") (Var (Just (20,26)-(20,30)) "add2")) (Var (Just (20,34)-(20,39)) "carry")) (Lit (Just (20,43)-(20,45)) (LI 10)),ConApp (Just (21,17)-(21,59)) "::" (Just (Tuple (Just (21,18)-(21,58)) [Bop (Just (21,18)-(21,50)) Mod (Bop (Just (21,19)-(21,42)) Plus (Bop (Just (21,20)-(21,33)) Plus (Var (Just (21,21)-(21,25)) "add1") (Var (Just (21,28)-(21,32)) "add2")) (Var (Just (21,36)-(21,41)) "carry")) (Lit (Just (21,47)-(21,49)) (LI 10)),Var (Just (21,54)-(21,58)) "rest"])) Nothing])]
*)

(* typed spans
(18,10)-(21,61)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
