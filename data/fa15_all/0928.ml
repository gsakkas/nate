
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = (1, []) in
  let args = makeTuple l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (aNum,wholeNum) ->
        (match a with
         | (zeros,total) ->
             ((zeros @ [0]),
               (bigAdd total ((mulByDigit aNum wholeNum) @ zeros)))) in
  let base = ([], []) in
  let args = let (x,y) = makeTuple l1 l2 in List.combine x y in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(9,14)-(10,72)
fun l ->
  (let f =
     fun a ->
       fun x ->
         if List.length a = 0
         then if x = 0 then [] else [x]
         else a @ [x] in
   let base = [] in
   List.fold_left f base l)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(10,2)-(10,72)
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (l1e , l2e) -> match a with
                            | (carry , list) -> (let num =
                                                   (l1e + l2e) + carry in
                                                 if num < 10
                                                 then (0 , [num] @ list)
                                                 else if num = 10
                                                      then (1 , [0] @ list)
                                                      else (num / 10 , [num mod 10] @ list)) in
     let base = (0 , []) in
     let args =
       List.combine (List.rev ([0] @ l1))
                    (List.rev ([0] @ l2)) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(10,2)-(10,72)
fun l1 ->
  fun l2 ->
    (let (x , y) =
       padZero l1 l2 in
     (List.rev x , clone y
                         (List.length y)))
LamG (LamG EmptyG)

(12,11)-(16,49)
fun i ->
  fun l ->
    if i < 1
    then []
    else bigAdd l
                (mulByDigit (i - 1) l)
LamG (LamG EmptyG)

(13,14)-(13,42)
match x with
| (aNum , wholeNum) -> match a with
                       | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                  (mulByDigit aNum
                                                                              wholeNum @ zeros))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(14,17)-(14,19)
[]
ListG EmptyG

(15,2)-(16,49)
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(15,26)-(15,28)
List.combine x y
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (9,19)-(12,42)) (VarPat (Just (9,19)-(9,20)) "l") (Let (Just (10,2)-(12,42)) NonRec [(VarPat (Just (10,6)-(10,7)) "f",Lam (Just (10,8)-(11,72)) (VarPat (Just (10,8)-(10,9)) "a") (Lam (Just (10,10)-(11,72)) (VarPat (Just (10,10)-(10,11)) "x") (Ite (Just (11,4)-(11,72)) (Bop (Just (11,7)-(11,26)) Eq (App (Just (11,7)-(11,22)) (Var (Just (11,8)-(11,19)) "List.length") [Var (Just (11,20)-(11,21)) "a"]) (Lit (Just (11,25)-(11,26)) (LI 0))) (Ite (Just (11,32)-(11,59)) (Bop (Just (11,36)-(11,41)) Eq (Var (Just (11,36)-(11,37)) "x") (Lit (Just (11,40)-(11,41)) (LI 0))) (List (Just (11,47)-(11,49)) [] Nothing) (List (Just (11,55)-(11,58)) [Var (Just (11,56)-(11,57)) "x"] Nothing)) (App (Just (11,65)-(11,72)) (Var (Just (11,67)-(11,68)) "@") [Var (Just (11,65)-(11,66)) "a",List (Just (11,69)-(11,72)) [Var (Just (11,70)-(11,71)) "x"] Nothing])) Nothing) Nothing)] (Let (Just (12,2)-(12,42)) NonRec [(VarPat (Just (12,6)-(12,10)) "base",List (Just (12,13)-(12,15)) [] Nothing)] (App (Just (12,19)-(12,42)) (Var (Just (12,19)-(12,33)) "List.fold_left") [Var (Just (12,34)-(12,35)) "f",Var (Just (12,36)-(12,40)) "base",Var (Just (12,41)-(12,42)) "l"]))) Nothing
Let (Just (15,2)-(31,34)) NonRec [(VarPat (Just (15,6)-(15,9)) "add",Lam (Just (15,11)-(30,51)) (TuplePat (Just (15,11)-(15,16)) [VarPat (Just (15,11)-(15,13)) "l1",VarPat (Just (15,14)-(15,16)) "l2"]) (Let (Just (16,4)-(30,51)) NonRec [(VarPat (Just (16,8)-(16,9)) "f",Lam (Just (16,10)-(27,58)) (VarPat (Just (16,10)-(16,11)) "a") (Lam (Just (16,12)-(27,58)) (VarPat (Just (16,12)-(16,13)) "x") (Case (Just (17,6)-(27,58)) (Var (Just (17,12)-(17,13)) "x") [(TuplePat (Just (18,9)-(18,16)) [VarPat (Just (18,9)-(18,12)) "l1e",VarPat (Just (18,13)-(18,16)) "l2e"],Nothing,Case (Just (19,10)-(27,58)) (Var (Just (19,17)-(19,18)) "a") [(TuplePat (Just (20,14)-(20,24)) [VarPat (Just (20,14)-(20,19)) "carry",VarPat (Just (20,20)-(20,24)) "list"],Nothing,Let (Just (21,15)-(27,57)) NonRec [(VarPat (Just (21,19)-(21,22)) "num",Bop (Just (21,25)-(21,44)) Plus (Bop (Just (21,25)-(21,36)) Plus (Var (Just (21,26)-(21,29)) "l1e") (Var (Just (21,32)-(21,35)) "l2e")) (Var (Just (21,39)-(21,44)) "carry"))] (Ite (Just (22,15)-(27,57)) (Bop (Just (22,18)-(22,26)) Lt (Var (Just (22,18)-(22,21)) "num") (Lit (Just (22,24)-(22,26)) (LI 10))) (Tuple (Just (23,20)-(23,39)) [Lit (Just (23,21)-(23,22)) (LI 0),App (Just (23,24)-(23,38)) (Var (Just (23,31)-(23,32)) "@") [List (Just (23,25)-(23,30)) [Var (Just (23,26)-(23,29)) "num"] Nothing,Var (Just (23,33)-(23,37)) "list"]]) (Ite (Just (25,17)-(27,57)) (Bop (Just (25,20)-(25,28)) Eq (Var (Just (25,20)-(25,23)) "num") (Lit (Just (25,26)-(25,28)) (LI 10))) (Tuple (Just (26,22)-(26,39)) [Lit (Just (26,23)-(26,24)) (LI 1),App (Just (26,26)-(26,38)) (Var (Just (26,31)-(26,32)) "@") [List (Just (26,27)-(26,30)) [Lit (Just (26,28)-(26,29)) (LI 0)] Nothing,Var (Just (26,33)-(26,37)) "list"]]) (Tuple (Just (27,22)-(27,57)) [Bop (Just (27,23)-(27,33)) Div (Var (Just (27,24)-(27,27)) "num") (Lit (Just (27,30)-(27,32)) (LI 10)),App (Just (27,35)-(27,56)) (Var (Just (27,49)-(27,50)) "@") [List (Just (27,36)-(27,48)) [Bop (Just (27,37)-(27,47)) Mod (Var (Just (27,37)-(27,40)) "num") (Lit (Just (27,45)-(27,47)) (LI 10))] Nothing,Var (Just (27,51)-(27,55)) "list"]]))))])]) Nothing) Nothing)] (Let (Just (28,4)-(30,51)) NonRec [(VarPat (Just (28,8)-(28,12)) "base",Tuple (Just (28,15)-(28,22)) [Lit (Just (28,16)-(28,17)) (LI 0),List (Just (28,19)-(28,21)) [] Nothing])] (Let (Just (29,4)-(30,51)) NonRec [(VarPat (Just (29,8)-(29,12)) "args",App (Just (29,15)-(29,71)) (Var (Just (29,15)-(29,27)) "List.combine") [App (Just (29,28)-(29,49)) (Var (Just (29,29)-(29,37)) "List.rev") [App (Just (29,38)-(29,48)) (Var (Just (29,43)-(29,44)) "@") [List (Just (29,39)-(29,42)) [Lit (Just (29,40)-(29,41)) (LI 0)] Nothing,Var (Just (29,45)-(29,47)) "l1"]],App (Just (29,50)-(29,71)) (Var (Just (29,51)-(29,59)) "List.rev") [App (Just (29,60)-(29,70)) (Var (Just (29,65)-(29,66)) "@") [List (Just (29,61)-(29,64)) [Lit (Just (29,62)-(29,63)) (LI 0)] Nothing,Var (Just (29,67)-(29,69)) "l2"]]])] (Let (Just (30,4)-(30,51)) NonRec [(TuplePat (Just (30,9)-(30,14)) [WildPat (Just (30,9)-(30,10)),VarPat (Just (30,11)-(30,14)) "res"],App (Just (30,18)-(30,44)) (Var (Just (30,18)-(30,32)) "List.fold_left") [Var (Just (30,33)-(30,34)) "f",Var (Just (30,35)-(30,39)) "base",Var (Just (30,40)-(30,44)) "args"])] (Var (Just (30,48)-(30,51)) "res"))))) Nothing)] (App (Just (31,2)-(31,34)) (Var (Just (31,2)-(31,12)) "removeZero") [App (Just (31,13)-(31,34)) (Var (Just (31,14)-(31,17)) "add") [App (Just (31,18)-(31,33)) (Var (Just (31,19)-(31,26)) "padZero") [Var (Just (31,27)-(31,29)) "l1",Var (Just (31,30)-(31,32)) "l2"]]])
Lam (Just (33,14)-(34,72)) (VarPat (Just (33,14)-(33,16)) "l1") (Lam (Just (33,17)-(34,72)) (VarPat (Just (33,17)-(33,19)) "l2") (Let (Just (34,2)-(34,72)) NonRec [(TuplePat (Just (34,7)-(34,10)) [VarPat (Just (34,7)-(34,8)) "x",VarPat (Just (34,9)-(34,10)) "y"],App (Just (34,14)-(34,27)) (Var (Just (34,14)-(34,21)) "padZero") [Var (Just (34,22)-(34,24)) "l1",Var (Just (34,25)-(34,27)) "l2"])] (Tuple (Just (34,31)-(34,72)) [App (Just (34,32)-(34,44)) (Var (Just (34,33)-(34,41)) "List.rev") [Var (Just (34,42)-(34,43)) "x"],App (Just (34,46)-(34,71)) (Var (Just (34,47)-(34,52)) "clone") [Var (Just (34,53)-(34,54)) "y",App (Just (34,55)-(34,70)) (Var (Just (34,56)-(34,67)) "List.length") [Var (Just (34,68)-(34,69)) "y"]]])) Nothing) Nothing
Lam (Just (36,19)-(37,55)) (VarPat (Just (36,19)-(36,20)) "i") (Lam (Just (36,21)-(37,55)) (VarPat (Just (36,21)-(36,22)) "l") (Ite (Just (37,2)-(37,55)) (Bop (Just (37,5)-(37,10)) Lt (Var (Just (37,5)-(37,6)) "i") (Lit (Just (37,9)-(37,10)) (LI 1))) (List (Just (37,16)-(37,18)) [] Nothing) (App (Just (37,24)-(37,55)) (Var (Just (37,24)-(37,30)) "bigAdd") [Var (Just (37,31)-(37,32)) "l",App (Just (37,33)-(37,55)) (Var (Just (37,34)-(37,44)) "mulByDigit") [Bop (Just (37,45)-(37,52)) Minus (Var (Just (37,46)-(37,47)) "i") (Lit (Just (37,50)-(37,51)) (LI 1)),Var (Just (37,53)-(37,54)) "l"]])) Nothing) Nothing
Case (Just (41,4)-(46,68)) (Var (Just (41,10)-(41,11)) "x") [(TuplePat (Just (42,7)-(42,20)) [VarPat (Just (42,7)-(42,11)) "aNum",VarPat (Just (42,12)-(42,20)) "wholeNum"],Nothing,Case (Just (43,8)-(46,68)) (Var (Just (43,15)-(43,16)) "a") [(TuplePat (Just (44,12)-(44,23)) [VarPat (Just (44,12)-(44,17)) "zeros",VarPat (Just (44,18)-(44,23)) "total"],Nothing,Tuple (Just (45,13)-(46,67)) [App (Just (45,14)-(45,27)) (Var (Just (45,21)-(45,22)) "@") [Var (Just (45,15)-(45,20)) "zeros",List (Just (45,23)-(45,26)) [Lit (Just (45,24)-(45,25)) (LI 0)] Nothing],App (Just (46,15)-(46,66)) (Var (Just (46,16)-(46,22)) "bigAdd") [Var (Just (46,23)-(46,28)) "total",App (Just (46,29)-(46,65)) (Var (Just (46,57)-(46,58)) "@") [App (Just (46,30)-(46,56)) (Var (Just (46,31)-(46,41)) "mulByDigit") [Var (Just (46,42)-(46,46)) "aNum",Var (Just (46,47)-(46,55)) "wholeNum"],Var (Just (46,59)-(46,64)) "zeros"]]])])]
List (Just (47,18)-(47,20)) [] Nothing
Let (Just (48,13)-(48,60)) NonRec [(TuplePat (Just (48,18)-(48,21)) [VarPat (Just (48,18)-(48,19)) "x",VarPat (Just (48,20)-(48,21)) "y"],App (Just (48,25)-(48,40)) (Var (Just (48,25)-(48,34)) "makeTuple") [Var (Just (48,35)-(48,37)) "l1",Var (Just (48,38)-(48,40)) "l2"])] (App (Just (48,44)-(48,60)) (Var (Just (48,44)-(48,56)) "List.combine") [Var (Just (48,57)-(48,58)) "x",Var (Just (48,59)-(48,60)) "y"])
App (Just (48,44)-(48,60)) (Var (Just (48,44)-(48,56)) "List.combine") [Var (Just (48,57)-(48,58)) "x",Var (Just (48,59)-(48,60)) "y"]
*)

(* typed spans
(9,19)-(12,42)
(15,2)-(31,34)
(33,14)-(34,72)
(36,19)-(37,55)
(41,4)-(46,68)
(47,18)-(47,20)
(48,13)-(48,60)
(48,44)-(48,60)
*)

(* correct types
int list -> int list
int list
int list -> int list -> (int list * int list list)
int -> int list -> int list
(int list * int list)
int list
(int * int list) list
(int * int list) list
*)

(* bad types
int list -> int list -> (int list * 'a)
(int list * 'a)
(int list * 'a)
int list -> int list -> 'a
(int * 'a list)
'a list
'a
int list
*)
