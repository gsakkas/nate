
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in
          ((sum / 10), (sum mod 10)) :: t in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,16)-(8,17)
fun x ->
  fun n ->
    if n < 1
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(4,7)-(4,27)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(4,15)-(4,24)
(@)
VarG

(4,16)-(4,17)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(4,21)-(4,23)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,25)-(4,27)
l1
VarG

(7,9)-(7,29)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(16,6)-(19,41)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Lam (Just (2,14)-(2,64)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,64)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Lt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 1))) (List (Just (2,34)-(2,36)) [] Nothing) (ConApp (Just (2,42)-(2,64)) "::" (Just (Tuple (Just (2,42)-(2,64)) [Var (Just (2,42)-(2,43)) "x",App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]])) Nothing)) Nothing) Nothing
Tuple (Just (6,7)-(6,67)) [App (Just (6,8)-(6,62)) (Var (Just (6,57)-(6,58)) "@") [App (Just (6,9)-(6,56)) (Var (Just (6,10)-(6,15)) "clone") [Lit (Just (6,16)-(6,17)) (LI 0),Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])],Var (Just (6,59)-(6,61)) "l1"],Var (Just (6,64)-(6,66)) "l2"]
Var (Just (6,57)-(6,58)) "@"
App (Just (6,9)-(6,56)) (Var (Just (6,10)-(6,15)) "clone") [Lit (Just (6,16)-(6,17)) (LI 0),Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])]
Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])
Var (Just (6,59)-(6,61)) "l1"
Tuple (Just (9,9)-(9,69)) [Var (Just (9,10)-(9,12)) "l1",App (Just (9,14)-(9,68)) (Var (Just (9,63)-(9,64)) "@") [App (Just (9,15)-(9,62)) (Var (Just (9,16)-(9,21)) "clone") [Lit (Just (9,22)-(9,23)) (LI 0),Bop (Just (9,24)-(9,61)) Minus (App (Just (9,25)-(9,41)) (Var (Just (9,26)-(9,37)) "List.length") [Var (Just (9,38)-(9,40)) "l1"]) (App (Just (9,44)-(9,60)) (Var (Just (9,45)-(9,56)) "List.length") [Var (Just (9,57)-(9,59)) "l2"])],Var (Just (9,65)-(9,67)) "l2"]]
Let (Just (18,6)-(21,31)) NonRec [(VarPat (Just (18,10)-(18,11)) "b",Bop (Just (18,14)-(18,31)) Plus (App (Just (18,14)-(18,21)) (Var (Just (18,15)-(18,18)) "fst") [Var (Just (18,19)-(18,20)) "x"]) (App (Just (18,24)-(18,31)) (Var (Just (18,25)-(18,28)) "snd") [Var (Just (18,29)-(18,30)) "x"]))] (Case (Just (19,6)-(21,31)) (Var (Just (19,12)-(19,13)) "a") [(ConsPat (Just (20,8)-(20,12)) (VarPat (Just (20,8)-(20,9)) "h") (VarPat (Just (20,11)-(20,12)) "t"),Nothing,ConApp (Just (20,16)-(20,55)) "::" (Just (Tuple (Just (20,16)-(20,55)) [Bop (Just (20,16)-(20,30)) Div (Bop (Just (20,17)-(20,24)) Plus (Var (Just (20,18)-(20,19)) "h") (Var (Just (20,22)-(20,23)) "b")) (Lit (Just (20,27)-(20,29)) (LI 10)),ConApp (Just (20,34)-(20,55)) "::" (Just (Tuple (Just (20,34)-(20,55)) [Bop (Just (20,34)-(20,50)) Mod (Bop (Just (20,35)-(20,42)) Plus (Var (Just (20,36)-(20,37)) "h") (Var (Just (20,40)-(20,41)) "b")) (Lit (Just (20,47)-(20,49)) (LI 10)),Var (Just (20,54)-(20,55)) "t"])) Nothing])) Nothing),(WildPat (Just (21,8)-(21,9)),Nothing,List (Just (21,13)-(21,31)) [Bop (Just (21,14)-(21,20)) Div (Var (Just (21,14)-(21,15)) "b") (Lit (Just (21,18)-(21,20)) (LI 10)),Bop (Just (21,22)-(21,30)) Mod (Var (Just (21,22)-(21,23)) "b") (Lit (Just (21,28)-(21,30)) (LI 10))] Nothing)])
*)

(* typed spans
(2,14)-(2,64)
(6,7)-(6,67)
(6,57)-(6,58)
(6,9)-(6,56)
(6,18)-(6,55)
(6,59)-(6,61)
(9,9)-(9,69)
(18,6)-(21,31)
*)

(* correct types
int -> int -> int list
(int list * int list)
int list -> int list -> int list
int list
int
int list
(int list * int list)
int list
*)

(* bad types
int list -> int list -> (int list * int list)
(int list * int list)
int list
int
int list
int list
(int list * int list)
(int * int) list
*)
