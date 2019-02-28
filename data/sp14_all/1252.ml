
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;


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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with
      | (w,[]) -> (w, [z / 10; z mod 10])
      | (w,h::t) -> (((w + z) / 10), (((w + z) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;

*)

(* changed spans
(17,6)-(17,71)
match a with
| (w , []) -> (w , [z / 10 ; z mod 10])
| (w , h :: t) -> ((w + z) / 10 , ((w + z) mod 10) :: t)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(18,15)-(18,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Case (Just (17,6)-(19,61)) (Var (Just (17,12)-(17,13)) "a") [(TuplePat (Just (18,9)-(18,13)) [VarPat (Just (18,9)-(18,10)) "w",ConPat (Just (18,11)-(18,13)) "[]" Nothing],Nothing,Tuple (Just (18,18)-(18,41)) [Var (Just (18,19)-(18,20)) "w",List (Just (18,22)-(18,40)) [Bop (Just (18,23)-(18,29)) Div (Var (Just (18,23)-(18,24)) "z") (Lit (Just (18,27)-(18,29)) (LI 10)),Bop (Just (18,31)-(18,39)) Mod (Var (Just (18,31)-(18,32)) "z") (Lit (Just (18,37)-(18,39)) (LI 10))] Nothing]),(TuplePat (Just (19,9)-(19,15)) [VarPat (Just (19,9)-(19,10)) "w",ConsPat (Just (19,11)-(19,15)) (VarPat (Just (19,11)-(19,12)) "h") (VarPat (Just (19,14)-(19,15)) "t")],Nothing,Tuple (Just (19,20)-(19,61)) [Bop (Just (19,21)-(19,35)) Div (Bop (Just (19,22)-(19,29)) Plus (Var (Just (19,23)-(19,24)) "w") (Var (Just (19,27)-(19,28)) "z")) (Lit (Just (19,32)-(19,34)) (LI 10)),ConApp (Just (19,37)-(19,60)) "::" (Just (Tuple (Just (19,38)-(19,59)) [Bop (Just (19,38)-(19,54)) Mod (Bop (Just (19,39)-(19,46)) Plus (Var (Just (19,40)-(19,41)) "w") (Var (Just (19,44)-(19,45)) "z")) (Lit (Just (19,51)-(19,53)) (LI 10)),Var (Just (19,58)-(19,59)) "t"])) Nothing])]
Tuple (Just (20,15)-(20,22)) [Lit (Just (20,16)-(20,17)) (LI 0),List (Just (20,19)-(20,21)) [] Nothing]
*)

(* typed spans
(17,6)-(19,61)
(20,15)-(20,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
(int * int list)
'a list
*)
