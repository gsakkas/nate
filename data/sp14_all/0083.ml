
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
    let f a x = (x mod 10) :: a in
    let base = (match l1 with | h -> h) + (match l2 with | h -> h) in
    let args = [] in let (_,res) = List.fold_left f base args in res in
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
(16,16)-(16,31)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(17,15)-(17,66)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(17,22)-(17,24)
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,42)-(17,66)
List.rev l2
AppG (fromList [VarG])

(18,4)-(18,68)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(18,4)-(18,68)
List.fold_left f base args
AppG (fromList [VarG])

(18,4)-(18,68)
List.fold_left
VarG

(18,4)-(18,68)
f
VarG

(18,4)-(18,68)
base
VarG

(18,4)-(18,68)
args
VarG

(18,4)-(18,68)
res
VarG

*)

(* changed exprs
Case (Just (17,6)-(21,23)) (App (Just (17,12)-(17,17)) (Var (Just (17,12)-(17,15)) "snd") [Var (Just (17,16)-(17,17)) "a"]) [(ConPat (Just (18,8)-(18,10)) "[]" Nothing,Nothing,Tuple (Just (19,10)-(20,67)) [Bop (Just (19,11)-(19,30)) Plus (App (Just (19,12)-(19,19)) (Var (Just (19,13)-(19,16)) "fst") [Var (Just (19,17)-(19,18)) "x"]) (App (Just (19,22)-(19,29)) (Var (Just (19,23)-(19,26)) "snd") [Var (Just (19,27)-(19,28)) "x"]),List (Just (20,12)-(20,66)) [Bop (Just (20,13)-(20,37)) Div (Bop (Just (20,13)-(20,32)) Plus (App (Just (20,14)-(20,21)) (Var (Just (20,15)-(20,18)) "fst") [Var (Just (20,19)-(20,20)) "x"]) (App (Just (20,24)-(20,31)) (Var (Just (20,25)-(20,28)) "snd") [Var (Just (20,29)-(20,30)) "x"])) (Lit (Just (20,35)-(20,37)) (LI 10)),Bop (Just (20,39)-(20,65)) Mod (Bop (Just (20,39)-(20,58)) Plus (App (Just (20,40)-(20,47)) (Var (Just (20,41)-(20,44)) "fst") [Var (Just (20,45)-(20,46)) "x"]) (App (Just (20,50)-(20,57)) (Var (Just (20,51)-(20,54)) "snd") [Var (Just (20,55)-(20,56)) "x"])) (Lit (Just (20,63)-(20,65)) (LI 10))] Nothing]),(ConsPat (Just (21,8)-(21,12)) (VarPat (Just (21,8)-(21,9)) "h") (VarPat (Just (21,11)-(21,12)) "t"),Nothing,Tuple (Just (21,16)-(21,23)) [Lit (Just (21,17)-(21,18)) (LI 0),List (Just (21,20)-(21,22)) [] Nothing])]
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
Let (Just (23,4)-(24,51)) NonRec [(VarPat (Just (23,8)-(23,12)) "args",App (Just (23,15)-(23,55)) (Var (Just (23,15)-(23,27)) "List.combine") [App (Just (23,28)-(23,41)) (Var (Just (23,29)-(23,37)) "List.rev") [Var (Just (23,38)-(23,40)) "l1"],App (Just (23,42)-(23,55)) (Var (Just (23,43)-(23,51)) "List.rev") [Var (Just (23,52)-(23,54)) "l2"]])] (Let (Just (24,4)-(24,51)) NonRec [(TuplePat (Just (24,9)-(24,14)) [WildPat (Just (24,9)-(24,10)),VarPat (Just (24,11)-(24,14)) "res"],App (Just (24,18)-(24,44)) (Var (Just (24,18)-(24,32)) "List.fold_left") [Var (Just (24,33)-(24,34)) "f",Var (Just (24,35)-(24,39)) "base",Var (Just (24,40)-(24,44)) "args"])] (Var (Just (24,48)-(24,51)) "res"))
App (Just (23,42)-(23,55)) (Var (Just (23,43)-(23,51)) "List.rev") [Var (Just (23,52)-(23,54)) "l2"]
Let (Just (24,4)-(24,51)) NonRec [(TuplePat (Just (24,9)-(24,14)) [WildPat (Just (24,9)-(24,10)),VarPat (Just (24,11)-(24,14)) "res"],App (Just (24,18)-(24,44)) (Var (Just (24,18)-(24,32)) "List.fold_left") [Var (Just (24,33)-(24,34)) "f",Var (Just (24,35)-(24,39)) "base",Var (Just (24,40)-(24,44)) "args"])] (Var (Just (24,48)-(24,51)) "res")
App (Just (24,18)-(24,44)) (Var (Just (24,18)-(24,32)) "List.fold_left") [Var (Just (24,33)-(24,34)) "f",Var (Just (24,35)-(24,39)) "base",Var (Just (24,40)-(24,44)) "args"]
Var (Just (24,18)-(24,32)) "List.fold_left"
Var (Just (24,33)-(24,34)) "f"
Var (Just (24,35)-(24,39)) "base"
Var (Just (24,40)-(24,44)) "args"
Var (Just (24,48)-(24,51)) "res"
*)

(* typed spans
(17,6)-(21,23)
(22,15)-(22,22)
(23,4)-(24,51)
(23,42)-(23,55)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
*)

(* correct types
(int * int list)
(int * int list)
int list
int list
int list
(int * int list)
((int * int list) -> (int * int) -> (int * int list)) -> (int * int list) -> (int * int) list -> (int * int list)
(int * int list) -> (int * int) -> (int * int list)
(int * int list)
(int * int) list
int list
*)

(* bad types
int list
int
int
int
'a
'a
'a
'a
'a
'a
'a
*)
