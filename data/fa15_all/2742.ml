
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry y = y / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [((remain car) + x1) + x2]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((carry h) + x1) + x2] @
                           ([((remain h) + x1) + x2] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,19)-(13,47)
fun y -> y / 10
LamG (BopG EmptyG EmptyG)

(22,19)-(23,69)
fun x -> x mod 10
LamG (BopG EmptyG EmptyG)

(27,16)-(27,32)
match x with
| (x1 , x2) -> match a with
               | (car , cur) -> match cur with
                                | [] -> if ((car + x1) + x2) > 10
                                        then (car + 1 , [car + 1] @ [(remain car + x1) + x2])
                                        else (0 , [car] @ [(car + x1) + x2])
                                | h :: t -> if ((x1 + x2) + h) < 10
                                            then (0 , [0] @ ([(x1 + x2) + h] @ t))
                                            else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(27,16)-(27,25)
remain
VarG

(27,26)-(27,32)
car
VarG

(27,26)-(27,32)
x1
VarG

(27,26)-(27,32)
x2
VarG

(27,30)-(27,31)
0
LitG

(28,4)-(29,74)
[car] @ [(car + x1) + x2]
AppG (fromList [ListG EmptyG])

(28,4)-(29,74)
if ((x1 + x2) + h) < 10
then (0 , [0] @ ([(x1 + x2) + h] @ t))
else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(28,15)-(28,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(29,48)-(29,74)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(30,2)-(30,34)
res
VarG

*)

(* changed exprs
Lam (Just (4,10)-(4,20)) (VarPat (Just (4,10)-(4,11)) "y") (Bop (Just (4,14)-(4,20)) Div (Var (Just (4,14)-(4,15)) "y") (Lit (Just (4,18)-(4,20)) (LI 10))) Nothing
Lam (Just (13,11)-(13,23)) (VarPat (Just (13,11)-(13,12)) "x") (Bop (Just (13,15)-(13,23)) Mod (Var (Just (13,15)-(13,16)) "x") (Lit (Just (13,21)-(13,23)) (LI 10))) Nothing
Case (Just (21,6)-(37,61)) (Var (Just (21,12)-(21,13)) "x") [(TuplePat (Just (22,9)-(22,14)) [VarPat (Just (22,9)-(22,11)) "x1",VarPat (Just (22,12)-(22,14)) "x2"],Nothing,Case (Just (23,10)-(37,61)) (Var (Just (23,17)-(23,18)) "a") [(TuplePat (Just (24,14)-(24,21)) [VarPat (Just (24,14)-(24,17)) "car",VarPat (Just (24,18)-(24,21)) "cur"],Nothing,Case (Just (25,15)-(37,60)) (Var (Just (25,22)-(25,25)) "cur") [(ConPat (Just (26,18)-(26,20)) "[]" Nothing,Nothing,Ite (Just (27,20)-(30,57)) (Bop (Just (27,23)-(27,45)) Gt (Bop (Just (27,23)-(27,40)) Plus (Bop (Just (27,24)-(27,34)) Plus (Var (Just (27,25)-(27,28)) "car") (Var (Just (27,31)-(27,33)) "x1")) (Var (Just (27,37)-(27,39)) "x2")) (Lit (Just (27,43)-(27,45)) (LI 10))) (Tuple (Just (29,22)-(29,75)) [Bop (Just (29,23)-(29,32)) Plus (Var (Just (29,24)-(29,27)) "car") (Lit (Just (29,30)-(29,31)) (LI 1)),App (Just (29,34)-(29,74)) (Var (Just (29,45)-(29,46)) "@") [List (Just (29,35)-(29,44)) [Bop (Just (29,36)-(29,43)) Plus (Var (Just (29,36)-(29,39)) "car") (Lit (Just (29,42)-(29,43)) (LI 1))] Nothing,List (Just (29,47)-(29,73)) [Bop (Just (29,48)-(29,72)) Plus (Bop (Just (29,48)-(29,67)) Plus (App (Just (29,49)-(29,61)) (Var (Just (29,50)-(29,56)) "remain") [Var (Just (29,57)-(29,60)) "car"]) (Var (Just (29,64)-(29,66)) "x1")) (Var (Just (29,70)-(29,72)) "x2")] Nothing]]) (Tuple (Just (30,25)-(30,57)) [Lit (Just (30,26)-(30,27)) (LI 0),App (Just (30,29)-(30,56)) (Var (Just (30,36)-(30,37)) "@") [List (Just (30,30)-(30,35)) [Var (Just (30,31)-(30,34)) "car"] Nothing,List (Just (30,38)-(30,55)) [Bop (Just (30,39)-(30,54)) Plus (Bop (Just (30,39)-(30,49)) Plus (Var (Just (30,40)-(30,43)) "car") (Var (Just (30,46)-(30,48)) "x1")) (Var (Just (30,52)-(30,54)) "x2")] Nothing]])),(ConsPat (Just (31,18)-(31,22)) (VarPat (Just (31,18)-(31,19)) "h") (VarPat (Just (31,21)-(31,22)) "t"),Nothing,Ite (Just (32,20)-(37,59)) (Bop (Just (32,23)-(32,43)) Lt (Bop (Just (32,23)-(32,38)) Plus (Bop (Just (32,24)-(32,33)) Plus (Var (Just (32,25)-(32,27)) "x1") (Var (Just (32,30)-(32,32)) "x2")) (Var (Just (32,36)-(32,37)) "h")) (Lit (Just (32,41)-(32,43)) (LI 10))) (Tuple (Just (33,25)-(33,59)) [Lit (Just (33,26)-(33,27)) (LI 0),App (Just (33,29)-(33,58)) (Var (Just (33,34)-(33,35)) "@") [List (Just (33,30)-(33,33)) [Lit (Just (33,31)-(33,32)) (LI 0)] Nothing,App (Just (33,36)-(33,57)) (Var (Just (33,53)-(33,54)) "@") [List (Just (33,37)-(33,52)) [Bop (Just (33,38)-(33,51)) Plus (Bop (Just (33,38)-(33,47)) Plus (Var (Just (33,39)-(33,41)) "x1") (Var (Just (33,44)-(33,46)) "x2")) (Var (Just (33,50)-(33,51)) "h")] Nothing,Var (Just (33,55)-(33,56)) "t"]]]) (Tuple (Just (35,22)-(37,59)) [Bop (Just (35,23)-(35,32)) Plus (Var (Just (35,24)-(35,27)) "car") (Lit (Just (35,30)-(35,31)) (LI 1)),App (Just (36,24)-(37,58)) (Var (Just (36,49)-(36,50)) "@") [List (Just (36,25)-(36,48)) [Bop (Just (36,26)-(36,47)) Plus (Bop (Just (36,26)-(36,42)) Plus (App (Just (36,27)-(36,36)) (Var (Just (36,28)-(36,33)) "carry") [Var (Just (36,34)-(36,35)) "h"]) (Var (Just (36,39)-(36,41)) "x1")) (Var (Just (36,45)-(36,47)) "x2")] Nothing,App (Just (37,27)-(37,57)) (Var (Just (37,53)-(37,54)) "@") [List (Just (37,28)-(37,52)) [Bop (Just (37,29)-(37,51)) Plus (Bop (Just (37,29)-(37,46)) Plus (App (Just (37,30)-(37,40)) (Var (Just (37,31)-(37,37)) "remain") [Var (Just (37,38)-(37,39)) "h"]) (Var (Just (37,43)-(37,45)) "x1")) (Var (Just (37,49)-(37,51)) "x2")] Nothing,Var (Just (37,55)-(37,56)) "t"]]]))])])]
Var (Just (29,50)-(29,56)) "remain"
Var (Just (29,57)-(29,60)) "car"
Var (Just (29,64)-(29,66)) "x1"
Var (Just (29,70)-(29,72)) "x2"
Lit (Just (30,26)-(30,27)) (LI 0)
App (Just (30,29)-(30,56)) (Var (Just (30,36)-(30,37)) "@") [List (Just (30,30)-(30,35)) [Var (Just (30,31)-(30,34)) "car"] Nothing,List (Just (30,38)-(30,55)) [Bop (Just (30,39)-(30,54)) Plus (Bop (Just (30,39)-(30,49)) Plus (Var (Just (30,40)-(30,43)) "car") (Var (Just (30,46)-(30,48)) "x1")) (Var (Just (30,52)-(30,54)) "x2")] Nothing]
Ite (Just (32,20)-(37,59)) (Bop (Just (32,23)-(32,43)) Lt (Bop (Just (32,23)-(32,38)) Plus (Bop (Just (32,24)-(32,33)) Plus (Var (Just (32,25)-(32,27)) "x1") (Var (Just (32,30)-(32,32)) "x2")) (Var (Just (32,36)-(32,37)) "h")) (Lit (Just (32,41)-(32,43)) (LI 10))) (Tuple (Just (33,25)-(33,59)) [Lit (Just (33,26)-(33,27)) (LI 0),App (Just (33,29)-(33,58)) (Var (Just (33,34)-(33,35)) "@") [List (Just (33,30)-(33,33)) [Lit (Just (33,31)-(33,32)) (LI 0)] Nothing,App (Just (33,36)-(33,57)) (Var (Just (33,53)-(33,54)) "@") [List (Just (33,37)-(33,52)) [Bop (Just (33,38)-(33,51)) Plus (Bop (Just (33,38)-(33,47)) Plus (Var (Just (33,39)-(33,41)) "x1") (Var (Just (33,44)-(33,46)) "x2")) (Var (Just (33,50)-(33,51)) "h")] Nothing,Var (Just (33,55)-(33,56)) "t"]]]) (Tuple (Just (35,22)-(37,59)) [Bop (Just (35,23)-(35,32)) Plus (Var (Just (35,24)-(35,27)) "car") (Lit (Just (35,30)-(35,31)) (LI 1)),App (Just (36,24)-(37,58)) (Var (Just (36,49)-(36,50)) "@") [List (Just (36,25)-(36,48)) [Bop (Just (36,26)-(36,47)) Plus (Bop (Just (36,26)-(36,42)) Plus (App (Just (36,27)-(36,36)) (Var (Just (36,28)-(36,33)) "carry") [Var (Just (36,34)-(36,35)) "h"]) (Var (Just (36,39)-(36,41)) "x1")) (Var (Just (36,45)-(36,47)) "x2")] Nothing,App (Just (37,27)-(37,57)) (Var (Just (37,53)-(37,54)) "@") [List (Just (37,28)-(37,52)) [Bop (Just (37,29)-(37,51)) Plus (Bop (Just (37,29)-(37,46)) Plus (App (Just (37,30)-(37,40)) (Var (Just (37,31)-(37,37)) "remain") [Var (Just (37,38)-(37,39)) "h"]) (Var (Just (37,43)-(37,45)) "x1")) (Var (Just (37,49)-(37,51)) "x2")] Nothing,Var (Just (37,55)-(37,56)) "t"]]])
Tuple (Just (38,15)-(38,22)) [Lit (Just (38,16)-(38,17)) (LI 0),List (Just (38,19)-(38,21)) [] Nothing]
Let (Just (40,4)-(40,51)) NonRec [(TuplePat (Just (40,9)-(40,14)) [WildPat (Just (40,9)-(40,10)),VarPat (Just (40,11)-(40,14)) "res"],App (Just (40,18)-(40,44)) (Var (Just (40,18)-(40,32)) "List.fold_left") [Var (Just (40,33)-(40,34)) "f",Var (Just (40,35)-(40,39)) "base",Var (Just (40,40)-(40,44)) "args"])] (Var (Just (40,48)-(40,51)) "res")
Var (Just (40,48)-(40,51)) "res"
*)

(* typed spans
(4,10)-(4,20)
(13,11)-(13,23)
(21,6)-(37,61)
(29,50)-(29,56)
(29,57)-(29,60)
(29,64)-(29,66)
(29,70)-(29,72)
(30,26)-(30,27)
(30,29)-(30,56)
(32,20)-(37,59)
(38,15)-(38,22)
(40,4)-(40,51)
(40,48)-(40,51)
*)

(* correct types
int -> int
int -> int
(int * int list)
int -> int
int
int
int
int
int list
(int * int list)
(int * int list)
int list
int list
*)

(* bad types
(int list * int list) -> int list
int list -> int list
int list
(int list * int list) -> int list
(int list * int list)
(int list * int list)
(int list * int list)
int list
int list
int list
int list
int list
int list
*)
