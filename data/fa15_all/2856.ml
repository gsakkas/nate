
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = a in
      let (o,p) = x in
      let z = (o + p) + m in
      if z > 9 then (1, ((z - 10) :: n)) else (0, (z :: n)) in
    let base = (0, []) in
    let args =
      let rec helper curList lt1 lt2 =
        match lt1 with
        | [] -> curList
        | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2) in
      helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,16)-(17,21)
let (m , n) = a in
let (o , p) = x in
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,15)-(18,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(19,4)-(19,74)
[]
ListG EmptyG

(19,15)-(19,23)
let rec helper =
  fun curList ->
    fun lt1 ->
      fun lt2 ->
        match lt1 with
        | [] -> curList
        | h :: t -> helper ((h , List.hd lt2) :: curList)
                           t (List.tl lt2) in
helper [] l1 l2
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(19,16)-(19,18)
h
VarG

(19,16)-(19,18)
List.hd lt2
AppG (fromList [VarG])

(19,16)-(19,18)
curList
VarG

(19,16)-(19,18)
t
VarG

(19,16)-(19,18)
List.tl lt2
AppG (fromList [VarG])

(19,16)-(19,18)
helper [] l1 l2
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
Let (Just (18,6)-(21,59)) NonRec [(TuplePat (Just (18,11)-(18,14)) [VarPat (Just (18,11)-(18,12)) "m",VarPat (Just (18,13)-(18,14)) "n"],Var (Just (18,18)-(18,19)) "a")] (Let (Just (19,6)-(21,59)) NonRec [(TuplePat (Just (19,11)-(19,14)) [VarPat (Just (19,11)-(19,12)) "o",VarPat (Just (19,13)-(19,14)) "p"],Var (Just (19,18)-(19,19)) "x")] (Let (Just (20,6)-(21,59)) NonRec [(VarPat (Just (20,10)-(20,11)) "z",Bop (Just (20,14)-(20,25)) Plus (Bop (Just (20,14)-(20,21)) Plus (Var (Just (20,15)-(20,16)) "o") (Var (Just (20,19)-(20,20)) "p")) (Var (Just (20,24)-(20,25)) "m"))] (Ite (Just (21,6)-(21,59)) (Bop (Just (21,9)-(21,14)) Gt (Var (Just (21,9)-(21,10)) "z") (Lit (Just (21,13)-(21,14)) (LI 9))) (Tuple (Just (21,20)-(21,40)) [Lit (Just (21,21)-(21,22)) (LI 1),ConApp (Just (21,24)-(21,39)) "::" (Just (Tuple (Just (21,25)-(21,38)) [Bop (Just (21,25)-(21,33)) Minus (Var (Just (21,26)-(21,27)) "z") (Lit (Just (21,30)-(21,32)) (LI 10)),Var (Just (21,37)-(21,38)) "n"])) Nothing]) (Tuple (Just (21,46)-(21,59)) [Lit (Just (21,47)-(21,48)) (LI 0),ConApp (Just (21,50)-(21,58)) "::" (Just (Tuple (Just (21,51)-(21,57)) [Var (Just (21,51)-(21,52)) "z",Var (Just (21,56)-(21,57)) "n"])) Nothing]))))
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
List (Just (22,19)-(22,21)) [] Nothing
Let (Just (24,6)-(28,21)) Rec [(VarPat (Just (24,14)-(24,20)) "helper",Lam (Just (24,21)-(27,72)) (VarPat (Just (24,21)-(24,28)) "curList") (Lam (Just (24,29)-(27,72)) (VarPat (Just (24,29)-(24,32)) "lt1") (Lam (Just (24,33)-(27,72)) (VarPat (Just (24,33)-(24,36)) "lt2") (Case (Just (25,8)-(27,72)) (Var (Just (25,14)-(25,17)) "lt1") [(ConPat (Just (26,10)-(26,12)) "[]" Nothing,Nothing,Var (Just (26,16)-(26,23)) "curList"),(ConsPat (Just (27,10)-(27,14)) (VarPat (Just (27,10)-(27,11)) "h") (VarPat (Just (27,13)-(27,14)) "t"),Nothing,App (Just (27,18)-(27,72)) (Var (Just (27,18)-(27,24)) "helper") [ConApp (Just (27,25)-(27,56)) "::" (Just (Tuple (Just (27,26)-(27,55)) [Tuple (Just (27,26)-(27,44)) [Var (Just (27,27)-(27,28)) "h",App (Just (27,30)-(27,43)) (Var (Just (27,31)-(27,38)) "List.hd") [Var (Just (27,39)-(27,42)) "lt2"]],Var (Just (27,48)-(27,55)) "curList"])) Nothing,Var (Just (27,57)-(27,58)) "t",App (Just (27,59)-(27,72)) (Var (Just (27,60)-(27,67)) "List.tl") [Var (Just (27,68)-(27,71)) "lt2"]])]) Nothing) Nothing) Nothing)] (App (Just (28,6)-(28,21)) (Var (Just (28,6)-(28,12)) "helper") [List (Just (28,13)-(28,15)) [] Nothing,Var (Just (28,16)-(28,18)) "l1",Var (Just (28,19)-(28,21)) "l2"])
Var (Just (27,27)-(27,28)) "h"
App (Just (27,30)-(27,43)) (Var (Just (27,31)-(27,38)) "List.hd") [Var (Just (27,39)-(27,42)) "lt2"]
Var (Just (27,48)-(27,55)) "curList"
Var (Just (27,57)-(27,58)) "t"
App (Just (27,59)-(27,72)) (Var (Just (27,60)-(27,67)) "List.tl") [Var (Just (27,68)-(27,71)) "lt2"]
App (Just (28,6)-(28,21)) (Var (Just (28,6)-(28,12)) "helper") [List (Just (28,13)-(28,15)) [] Nothing,Var (Just (28,16)-(28,18)) "l1",Var (Just (28,19)-(28,21)) "l2"]
*)

(* typed spans
(18,6)-(21,59)
(22,15)-(22,22)
(22,19)-(22,21)
(24,6)-(28,21)
(27,27)-(27,28)
(27,30)-(27,43)
(27,48)-(27,55)
(27,57)-(27,58)
(27,59)-(27,72)
(28,6)-(28,21)
*)

(* correct types
(int * int list)
(int * int list)
int list
(int * int) list
int
int
(int * int) list
int list
int list
(int * int) list
*)

(* bad types
int
int
int list
(int list * int list)
int list
int list
int list
int list
int list
int list
*)
