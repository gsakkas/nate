
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      match s with
      | [] -> (c + 0) :: s
      | _ -> ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      match (c, s) with
      | (c,[]) -> (c, (c :: s))
      | _ -> ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(20,72)
match (c , s) with
| (c , []) -> (c , c :: s)
| _ -> (((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (18,6)-(20,72)) (Tuple (Just (18,12)-(18,18)) [Var (Just (18,13)-(18,14)) "c",Var (Just (18,16)-(18,17)) "s"]) [(TuplePat (Just (19,9)-(19,13)) [VarPat (Just (19,9)-(19,10)) "c",ConPat (Just (19,11)-(19,13)) "[]" Nothing],Nothing,Tuple (Just (19,18)-(19,31)) [Var (Just (19,19)-(19,20)) "c",ConApp (Just (19,22)-(19,30)) "::" (Just (Tuple (Just (19,23)-(19,29)) [Var (Just (19,23)-(19,24)) "c",Var (Just (19,28)-(19,29)) "s"])) Nothing]),(WildPat (Just (20,8)-(20,9)),Nothing,Tuple (Just (20,13)-(20,72)) [Bop (Just (20,14)-(20,37)) Div (Bop (Just (20,15)-(20,31)) Plus (Bop (Just (20,16)-(20,24)) Plus (Var (Just (20,17)-(20,18)) "c") (Var (Just (20,21)-(20,23)) "x'")) (Var (Just (20,27)-(20,30)) "x''")) (Lit (Just (20,34)-(20,36)) (LI 10)),ConApp (Just (20,39)-(20,71)) "::" (Just (Tuple (Just (20,40)-(20,70)) [Bop (Just (20,40)-(20,65)) Mod (Bop (Just (20,41)-(20,57)) Plus (Bop (Just (20,42)-(20,50)) Plus (Var (Just (20,43)-(20,44)) "c") (Var (Just (20,47)-(20,49)) "x'")) (Var (Just (20,53)-(20,56)) "x''")) (Lit (Just (20,62)-(20,64)) (LI 10)),Var (Just (20,69)-(20,70)) "s"])) Nothing])]
*)

(* typed spans
(18,6)-(20,72)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
