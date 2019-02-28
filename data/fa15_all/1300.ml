
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((x + a), (x + a)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,temp) = a in
      let s = (x1 + x2) + carry in
      let carry' = s / 10 in
      let rem = s mod 10 in
      let acc = rem :: temp in
      if (List.length acc) = (List.length l1)
      then (0, (carry' :: acc))
      else (carry', acc) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,34)
let (x1 , x2) = x in
let (carry , temp) = a in
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,19)-(20,20)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,4)-(22,51)
[]
ListG EmptyG

(21,15)-(21,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Let (Just (20,6)-(28,24)) NonRec [(TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "x1",VarPat (Just (20,14)-(20,16)) "x2"],Var (Just (20,20)-(20,21)) "x")] (Let (Just (21,6)-(28,24)) NonRec [(TuplePat (Just (21,11)-(21,21)) [VarPat (Just (21,11)-(21,16)) "carry",VarPat (Just (21,17)-(21,21)) "temp"],Var (Just (21,25)-(21,26)) "a")] (Let (Just (22,6)-(28,24)) NonRec [(VarPat (Just (22,10)-(22,11)) "s",Bop (Just (22,14)-(22,31)) Plus (Bop (Just (22,14)-(22,23)) Plus (Var (Just (22,15)-(22,17)) "x1") (Var (Just (22,20)-(22,22)) "x2")) (Var (Just (22,26)-(22,31)) "carry"))] (Let (Just (23,6)-(28,24)) NonRec [(VarPat (Just (23,10)-(23,16)) "carry'",Bop (Just (23,19)-(23,25)) Div (Var (Just (23,19)-(23,20)) "s") (Lit (Just (23,23)-(23,25)) (LI 10)))] (Let (Just (24,6)-(28,24)) NonRec [(VarPat (Just (24,10)-(24,13)) "rem",Bop (Just (24,16)-(24,24)) Mod (Var (Just (24,16)-(24,17)) "s") (Lit (Just (24,22)-(24,24)) (LI 10)))] (Let (Just (25,6)-(28,24)) NonRec [(VarPat (Just (25,10)-(25,13)) "acc",ConApp (Just (25,16)-(25,27)) "::" (Just (Tuple (Just (25,16)-(25,27)) [Var (Just (25,16)-(25,19)) "rem",Var (Just (25,23)-(25,27)) "temp"])) Nothing)] (Ite (Just (26,6)-(28,24)) (Bop (Just (26,9)-(26,45)) Eq (App (Just (26,9)-(26,26)) (Var (Just (26,10)-(26,21)) "List.length") [Var (Just (26,22)-(26,25)) "acc"]) (App (Just (26,29)-(26,45)) (Var (Just (26,30)-(26,41)) "List.length") [Var (Just (26,42)-(26,44)) "l1"])) (Tuple (Just (27,11)-(27,31)) [Lit (Just (27,12)-(27,13)) (LI 0),ConApp (Just (27,15)-(27,30)) "::" (Just (Tuple (Just (27,16)-(27,29)) [Var (Just (27,16)-(27,22)) "carry'",Var (Just (27,26)-(27,29)) "acc"])) Nothing]) (Tuple (Just (28,11)-(28,24)) [Var (Just (28,12)-(28,18)) "carry'",Var (Just (28,20)-(28,23)) "acc"])))))))
Let (Just (29,4)-(31,51)) NonRec [(VarPat (Just (29,8)-(29,12)) "base",Tuple (Just (29,15)-(29,22)) [Lit (Just (29,16)-(29,17)) (LI 0),List (Just (29,19)-(29,21)) [] Nothing])] (Let (Just (30,4)-(31,51)) NonRec [(VarPat (Just (30,8)-(30,12)) "args",App (Just (30,15)-(30,44)) (Var (Just (30,15)-(30,23)) "List.rev") [App (Just (30,24)-(30,44)) (Var (Just (30,25)-(30,37)) "List.combine") [Var (Just (30,38)-(30,40)) "l1",Var (Just (30,41)-(30,43)) "l2"]])] (Let (Just (31,4)-(31,51)) NonRec [(TuplePat (Just (31,9)-(31,14)) [WildPat (Just (31,9)-(31,10)),VarPat (Just (31,11)-(31,14)) "res"],App (Just (31,18)-(31,44)) (Var (Just (31,18)-(31,32)) "List.fold_left") [Var (Just (31,33)-(31,34)) "f",Var (Just (31,35)-(31,39)) "base",Var (Just (31,40)-(31,44)) "args"])] (Var (Just (31,48)-(31,51)) "res")))
List (Just (29,19)-(29,21)) [] Nothing
App (Just (30,15)-(30,44)) (Var (Just (30,15)-(30,23)) "List.rev") [App (Just (30,24)-(30,44)) (Var (Just (30,25)-(30,37)) "List.combine") [Var (Just (30,38)-(30,40)) "l1",Var (Just (30,41)-(30,43)) "l2"]]
*)

(* typed spans
(20,6)-(28,24)
(29,4)-(31,51)
(29,19)-(29,21)
(30,15)-(30,44)
*)

(* correct types
(int * int list)
int list
int list
(int * int) list
*)

(* bad types
(int * int)
int
int list
(int * int) list
*)
