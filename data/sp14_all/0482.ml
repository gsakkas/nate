
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      match x with
      | (x1,x2)::t ->
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in (tens, ones) :: a
      | [] -> a in
    let base = [(0, 0)] in
    let args = List.rev List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(25,15)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(26,15)-(26,23)
([] , [])
TupleG (fromList [ListG EmptyG])

(26,15)-(26,23)
[]
ListG EmptyG

(27,4)-(28,51)
[]
ListG EmptyG

(27,15)-(27,42)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (20,6)-(24,71)) NonRec [(TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "x1",VarPat (Just (20,14)-(20,16)) "x2"],Var (Just (20,20)-(20,21)) "x")] (Let (Just (21,6)-(24,71)) NonRec [(TuplePat (Just (21,11)-(21,16)) [VarPat (Just (21,11)-(21,13)) "a1",VarPat (Just (21,14)-(21,16)) "a2"],Var (Just (21,20)-(21,21)) "a")] (Let (Just (22,6)-(24,71)) NonRec [(ConsPat (Just (22,10)-(22,14)) (VarPat (Just (22,10)-(22,11)) "h") (WildPat (Just (22,13)-(22,14))),Var (Just (22,17)-(22,19)) "a1")] (Let (Just (23,6)-(24,71)) NonRec [(VarPat (Just (23,10)-(23,14)) "tens",Bop (Just (23,17)-(23,37)) Plus (Bop (Just (23,17)-(23,26)) Plus (Var (Just (23,18)-(23,20)) "x1") (Var (Just (23,23)-(23,25)) "x2")) (Bop (Just (23,29)-(23,37)) Div (Var (Just (23,30)-(23,31)) "h") (Lit (Just (23,34)-(23,36)) (LI 10))))] (Let (Just (24,6)-(24,71)) NonRec [(VarPat (Just (24,10)-(24,14)) "ones",Bop (Just (24,17)-(24,39)) Plus (Bop (Just (24,17)-(24,26)) Plus (Var (Just (24,18)-(24,20)) "x1") (Var (Just (24,23)-(24,25)) "x2")) (Bop (Just (24,29)-(24,39)) Mod (Var (Just (24,30)-(24,31)) "h") (Lit (Just (24,36)-(24,38)) (LI 10))))] (Tuple (Just (24,43)-(24,71)) [ConApp (Just (24,44)-(24,56)) "::" (Just (Tuple (Just (24,45)-(24,55)) [Var (Just (24,45)-(24,49)) "tens",Var (Just (24,53)-(24,55)) "a1"])) Nothing,ConApp (Just (24,58)-(24,70)) "::" (Just (Tuple (Just (24,59)-(24,69)) [Var (Just (24,59)-(24,63)) "ones",Var (Just (24,67)-(24,69)) "a2"])) Nothing])))))
Tuple (Just (25,15)-(25,23)) [List (Just (25,16)-(25,18)) [] Nothing,List (Just (25,20)-(25,22)) [] Nothing]
List (Just (25,16)-(25,18)) [] Nothing
List (Just (25,20)-(25,22)) [] Nothing
App (Just (26,15)-(26,44)) (Var (Just (26,15)-(26,23)) "List.rev") [App (Just (26,24)-(26,44)) (Var (Just (26,25)-(26,37)) "List.combine") [Var (Just (26,38)-(26,40)) "l1",Var (Just (26,41)-(26,43)) "l2"]]
*)

(* typed spans
(20,6)-(24,71)
(25,15)-(25,23)
(25,16)-(25,18)
(25,20)-(25,22)
(26,15)-(26,44)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
int list
(int * int) list
*)

(* bad types
(int * int) list
(int * int) list
(int * int) list
int list
'a
*)
