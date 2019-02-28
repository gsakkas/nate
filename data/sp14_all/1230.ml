
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
    let base = [] in
    let args = (0, (List.rev (List.combine l1 l2))) in
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

(20,4)-(21,51)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(20,4)-(21,51)
0
LitG

(20,4)-(21,51)
[]
ListG EmptyG

(20,19)-(20,50)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (19,6)-(20,71)) NonRec [(VarPat (Just (19,10)-(19,11)) "z",Bop (Just (19,14)-(19,31)) Plus (App (Just (19,14)-(19,21)) (Var (Just (19,15)-(19,18)) "fst") [Var (Just (19,19)-(19,20)) "x"]) (App (Just (19,24)-(19,31)) (Var (Just (19,25)-(19,28)) "snd") [Var (Just (19,29)-(19,30)) "x"]))] (Case (Just (20,6)-(20,71)) (Var (Just (20,12)-(20,13)) "a") [(TuplePat (Just (20,22)-(20,25)) [VarPat (Just (20,22)-(20,23)) "w",VarPat (Just (20,24)-(20,25)) "y"],Nothing,Tuple (Just (20,30)-(20,71)) [Bop (Just (20,31)-(20,45)) Div (Bop (Just (20,32)-(20,39)) Plus (Var (Just (20,33)-(20,34)) "w") (Var (Just (20,37)-(20,38)) "z")) (Lit (Just (20,42)-(20,44)) (LI 10)),ConApp (Just (20,47)-(20,70)) "::" (Just (Tuple (Just (20,48)-(20,69)) [Bop (Just (20,48)-(20,64)) Mod (Bop (Just (20,49)-(20,56)) Plus (Var (Just (20,50)-(20,51)) "w") (Var (Just (20,54)-(20,55)) "z")) (Lit (Just (20,61)-(20,63)) (LI 10)),Var (Just (20,68)-(20,69)) "y"])) Nothing])])
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
Lit (Just (21,16)-(21,17)) (LI 0)
List (Just (21,19)-(21,21)) [] Nothing
Let (Just (22,4)-(23,51)) NonRec [(VarPat (Just (22,8)-(22,12)) "args",App (Just (22,15)-(22,44)) (Var (Just (22,15)-(22,23)) "List.rev") [App (Just (22,24)-(22,44)) (Var (Just (22,25)-(22,37)) "List.combine") [Var (Just (22,38)-(22,40)) "l1",Var (Just (22,41)-(22,43)) "l2"]])] (Let (Just (23,4)-(23,51)) NonRec [(TuplePat (Just (23,9)-(23,14)) [WildPat (Just (23,9)-(23,10)),VarPat (Just (23,11)-(23,14)) "res"],App (Just (23,18)-(23,44)) (Var (Just (23,18)-(23,32)) "List.fold_left") [Var (Just (23,33)-(23,34)) "f",Var (Just (23,35)-(23,39)) "base",Var (Just (23,40)-(23,44)) "args"])] (Var (Just (23,48)-(23,51)) "res"))
*)

(* typed spans
(19,6)-(20,71)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
*)

(* correct types
(int * int list)
(int * int list)
int
int list
int list
*)

(* bad types
'a list
int list
int list
int list
(int * int) list
*)
