
let bigMul l1 l2 =
  let f a x = (a, x) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))
        (helper [] (h * i));;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (k,v) -> (match a with | (c,d) -> (c, (bigAdd d (mulByDigit k v)))) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,11)-(11,49)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
LamG (LamG EmptyG)

(3,2)-(11,49)
if List.length l1 < List.length l2
then (List.append (clone 0
                         (List.length l2 - List.length l1))
                  l1 , l2)
else (l1 , List.append (clone 0
                              (List.length l1 - List.length l2))
                       l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(3,2)-(11,49)
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,2)-(11,49)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(3,14)-(3,20)
match x with
| (v1 , v2) -> match a with
               | (list1 , list2) -> match list1 with
                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(3,18)-(3,19)
let base = ([] , []) in
let args =
  List.append (List.rev (List.combine l1
                                      l2)) [(0 , 0)] in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,18)-(3,19)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

(3,18)-(3,19)
fun i ->
  fun l ->
    match List.rev l with
    | [] -> []
    | h :: t -> (let rec helper =
                   fun acc ->
                     fun v ->
                       if v = 0
                       then acc
                       else helper ((v mod 10) :: acc)
                                   (v / 10) in
                 bigAdd (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)))
                        (helper [] (h * i)))
LamG (LamG EmptyG)

(4,2)-(11,49)
10
LitG

(4,2)-(11,49)
t
VarG

(4,2)-(11,49)
helper [] (h * i)
AppG (fromList [BopG EmptyG EmptyG,ListG EmptyG])

(4,2)-(11,49)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (k , v) -> match a with
                        | (c , d) -> (c , bigAdd d
                                                 (mulByDigit k
                                                             v)) in
     let base = ([] , [0]) in
     let args =
       (let rec helper =
          fun acc ->
            fun l1 ->
              fun l2 ->
                match l1 with
                | [] -> acc
                | h :: t -> helper ((h , l2) :: acc)
                                   (List.map (fun x ->
                                                x * 10) t)
                                   l2 in
        helper [] (List.rev l1) l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (2,14)-(2,64)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,64)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Gt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 0))) (ConApp (Just (2,34)-(2,56)) "::" (Just (Tuple (Just (2,34)-(2,56)) [Var (Just (2,34)-(2,35)) "x",App (Just (2,39)-(2,56)) (Var (Just (2,40)-(2,45)) "clone") [Var (Just (2,46)-(2,47)) "x",Bop (Just (2,48)-(2,55)) Minus (Var (Just (2,49)-(2,50)) "n") (Lit (Just (2,53)-(2,54)) (LI 1))]])) Nothing) (List (Just (2,62)-(2,64)) [] Nothing)) Nothing) Nothing
Ite (Just (5,2)-(7,77)) (Bop (Just (5,5)-(5,40)) Lt (App (Just (5,5)-(5,21)) (Var (Just (5,6)-(5,17)) "List.length") [Var (Just (5,18)-(5,20)) "l1"]) (App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,36)) "List.length") [Var (Just (5,37)-(5,39)) "l2"])) (Tuple (Just (6,7)-(6,77)) [App (Just (6,8)-(6,72)) (Var (Just (6,9)-(6,20)) "List.append") [App (Just (6,21)-(6,68)) (Var (Just (6,22)-(6,27)) "clone") [Lit (Just (6,28)-(6,29)) (LI 0),Bop (Just (6,30)-(6,67)) Minus (App (Just (6,31)-(6,47)) (Var (Just (6,32)-(6,43)) "List.length") [Var (Just (6,44)-(6,46)) "l2"]) (App (Just (6,50)-(6,66)) (Var (Just (6,51)-(6,62)) "List.length") [Var (Just (6,63)-(6,65)) "l1"])],Var (Just (6,69)-(6,71)) "l1"],Var (Just (6,74)-(6,76)) "l2"]) (Tuple (Just (7,7)-(7,77)) [Var (Just (7,8)-(7,10)) "l1",App (Just (7,12)-(7,76)) (Var (Just (7,13)-(7,24)) "List.append") [App (Just (7,25)-(7,72)) (Var (Just (7,26)-(7,31)) "clone") [Lit (Just (7,32)-(7,33)) (LI 0),Bop (Just (7,34)-(7,71)) Minus (App (Just (7,35)-(7,51)) (Var (Just (7,36)-(7,47)) "List.length") [Var (Just (7,48)-(7,50)) "l1"]) (App (Just (7,54)-(7,70)) (Var (Just (7,55)-(7,66)) "List.length") [Var (Just (7,67)-(7,69)) "l2"])],Var (Just (7,73)-(7,75)) "l2"]])
Lam (Just (9,19)-(10,69)) (VarPat (Just (9,19)-(9,20)) "l") (Case (Just (10,2)-(10,69)) (Var (Just (10,8)-(10,9)) "l") [(ConPat (Just (10,17)-(10,19)) "[]" Nothing,Nothing,List (Just (10,23)-(10,25)) [] Nothing),(ConsPat (Just (10,28)-(10,32)) (VarPat (Just (10,28)-(10,29)) "h") (VarPat (Just (10,31)-(10,32)) "t"),Nothing,Ite (Just (10,36)-(10,69)) (Bop (Just (10,39)-(10,44)) Eq (Var (Just (10,39)-(10,40)) "h") (Lit (Just (10,43)-(10,44)) (LI 0))) (App (Just (10,50)-(10,62)) (Var (Just (10,50)-(10,60)) "removeZero") [Var (Just (10,61)-(10,62)) "t"]) (Var (Just (10,68)-(10,69)) "l"))]) Nothing
Lam (Just (12,11)-(29,34)) (VarPat (Just (12,11)-(12,13)) "l1") (Lam (Just (12,14)-(29,34)) (VarPat (Just (12,14)-(12,16)) "l2") (Let (Just (13,2)-(29,34)) NonRec [(VarPat (Just (13,6)-(13,9)) "add",Lam (Just (13,11)-(28,51)) (TuplePat (Just (13,11)-(13,16)) [VarPat (Just (13,11)-(13,13)) "l1",VarPat (Just (13,14)-(13,16)) "l2"]) (Let (Just (14,4)-(28,51)) NonRec [(VarPat (Just (14,8)-(14,9)) "f",Lam (Just (14,10)-(25,60)) (VarPat (Just (14,10)-(14,11)) "a") (Lam (Just (14,12)-(25,60)) (VarPat (Just (14,12)-(14,13)) "x") (Case (Just (15,6)-(25,60)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,14)) [VarPat (Just (16,9)-(16,11)) "v1",VarPat (Just (16,12)-(16,14)) "v2"],Nothing,Case (Just (17,10)-(25,60)) (Var (Just (17,17)-(17,18)) "a") [(TuplePat (Just (18,14)-(18,25)) [VarPat (Just (18,14)-(18,19)) "list1",VarPat (Just (18,20)-(18,25)) "list2"],Nothing,Case (Just (19,15)-(25,59)) (Var (Just (19,22)-(19,27)) "list1") [(ConPat (Just (20,18)-(20,20)) "[]" Nothing,Nothing,Tuple (Just (21,20)-(22,29)) [ConApp (Just (21,21)-(21,48)) "::" (Just (Tuple (Just (21,22)-(21,47)) [Bop (Just (21,22)-(21,38)) Div (Bop (Just (21,23)-(21,32)) Plus (Var (Just (21,24)-(21,26)) "v1") (Var (Just (21,29)-(21,31)) "v2")) (Lit (Just (21,35)-(21,37)) (LI 10)),Var (Just (21,42)-(21,47)) "list1"])) Nothing,ConApp (Just (21,50)-(22,28)) "::" (Just (Tuple (Just (21,51)-(22,27)) [Bop (Just (21,51)-(21,69)) Mod (Bop (Just (21,52)-(21,61)) Plus (Var (Just (21,53)-(21,55)) "v1") (Var (Just (21,58)-(21,60)) "v2")) (Lit (Just (21,66)-(21,68)) (LI 10)),Var (Just (22,22)-(22,27)) "list2"])) Nothing]),(ConsPat (Just (23,18)-(23,22)) (VarPat (Just (23,18)-(23,19)) "h") (VarPat (Just (23,21)-(23,22)) "t"),Nothing,Tuple (Just (24,20)-(25,58)) [ConApp (Just (24,21)-(24,54)) "::" (Just (Tuple (Just (24,22)-(24,53)) [Bop (Just (24,22)-(24,44)) Div (Bop (Just (24,23)-(24,38)) Plus (Bop (Just (24,24)-(24,33)) Plus (Var (Just (24,25)-(24,27)) "v1") (Var (Just (24,30)-(24,32)) "v2")) (Var (Just (24,36)-(24,37)) "h")) (Lit (Just (24,41)-(24,43)) (LI 10)),Var (Just (24,48)-(24,53)) "list1"])) Nothing,ConApp (Just (25,22)-(25,57)) "::" (Just (Tuple (Just (25,23)-(25,56)) [Bop (Just (25,23)-(25,47)) Mod (Bop (Just (25,24)-(25,39)) Plus (Bop (Just (25,25)-(25,34)) Plus (Var (Just (25,26)-(25,28)) "v1") (Var (Just (25,31)-(25,33)) "v2")) (Var (Just (25,37)-(25,38)) "h")) (Lit (Just (25,44)-(25,46)) (LI 10)),Var (Just (25,51)-(25,56)) "list2"])) Nothing])])])]) Nothing) Nothing)] (Let (Just (26,4)-(28,51)) NonRec [(VarPat (Just (26,8)-(26,12)) "base",Tuple (Just (26,15)-(26,23)) [List (Just (26,16)-(26,18)) [] Nothing,List (Just (26,20)-(26,22)) [] Nothing])] (Let (Just (27,4)-(28,51)) NonRec [(VarPat (Just (27,8)-(27,12)) "args",App (Just (27,15)-(27,67)) (Var (Just (27,15)-(27,26)) "List.append") [App (Just (27,27)-(27,58)) (Var (Just (27,28)-(27,36)) "List.rev") [App (Just (27,37)-(27,57)) (Var (Just (27,38)-(27,50)) "List.combine") [Var (Just (27,51)-(27,53)) "l1",Var (Just (27,54)-(27,56)) "l2"]],List (Just (27,59)-(27,67)) [Tuple (Just (27,60)-(27,66)) [Lit (Just (27,61)-(27,62)) (LI 0),Lit (Just (27,64)-(27,65)) (LI 0)]] Nothing])] (Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res"))))) Nothing)] (App (Just (29,2)-(29,34)) (Var (Just (29,2)-(29,12)) "removeZero") [App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]])) Nothing) Nothing
Case (Just (15,6)-(25,60)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,14)) [VarPat (Just (16,9)-(16,11)) "v1",VarPat (Just (16,12)-(16,14)) "v2"],Nothing,Case (Just (17,10)-(25,60)) (Var (Just (17,17)-(17,18)) "a") [(TuplePat (Just (18,14)-(18,25)) [VarPat (Just (18,14)-(18,19)) "list1",VarPat (Just (18,20)-(18,25)) "list2"],Nothing,Case (Just (19,15)-(25,59)) (Var (Just (19,22)-(19,27)) "list1") [(ConPat (Just (20,18)-(20,20)) "[]" Nothing,Nothing,Tuple (Just (21,20)-(22,29)) [ConApp (Just (21,21)-(21,48)) "::" (Just (Tuple (Just (21,22)-(21,47)) [Bop (Just (21,22)-(21,38)) Div (Bop (Just (21,23)-(21,32)) Plus (Var (Just (21,24)-(21,26)) "v1") (Var (Just (21,29)-(21,31)) "v2")) (Lit (Just (21,35)-(21,37)) (LI 10)),Var (Just (21,42)-(21,47)) "list1"])) Nothing,ConApp (Just (21,50)-(22,28)) "::" (Just (Tuple (Just (21,51)-(22,27)) [Bop (Just (21,51)-(21,69)) Mod (Bop (Just (21,52)-(21,61)) Plus (Var (Just (21,53)-(21,55)) "v1") (Var (Just (21,58)-(21,60)) "v2")) (Lit (Just (21,66)-(21,68)) (LI 10)),Var (Just (22,22)-(22,27)) "list2"])) Nothing]),(ConsPat (Just (23,18)-(23,22)) (VarPat (Just (23,18)-(23,19)) "h") (VarPat (Just (23,21)-(23,22)) "t"),Nothing,Tuple (Just (24,20)-(25,58)) [ConApp (Just (24,21)-(24,54)) "::" (Just (Tuple (Just (24,22)-(24,53)) [Bop (Just (24,22)-(24,44)) Div (Bop (Just (24,23)-(24,38)) Plus (Bop (Just (24,24)-(24,33)) Plus (Var (Just (24,25)-(24,27)) "v1") (Var (Just (24,30)-(24,32)) "v2")) (Var (Just (24,36)-(24,37)) "h")) (Lit (Just (24,41)-(24,43)) (LI 10)),Var (Just (24,48)-(24,53)) "list1"])) Nothing,ConApp (Just (25,22)-(25,57)) "::" (Just (Tuple (Just (25,23)-(25,56)) [Bop (Just (25,23)-(25,47)) Mod (Bop (Just (25,24)-(25,39)) Plus (Bop (Just (25,25)-(25,34)) Plus (Var (Just (25,26)-(25,28)) "v1") (Var (Just (25,31)-(25,33)) "v2")) (Var (Just (25,37)-(25,38)) "h")) (Lit (Just (25,44)-(25,46)) (LI 10)),Var (Just (25,51)-(25,56)) "list2"])) Nothing])])])]
Let (Just (26,4)-(28,51)) NonRec [(VarPat (Just (26,8)-(26,12)) "base",Tuple (Just (26,15)-(26,23)) [List (Just (26,16)-(26,18)) [] Nothing,List (Just (26,20)-(26,22)) [] Nothing])] (Let (Just (27,4)-(28,51)) NonRec [(VarPat (Just (27,8)-(27,12)) "args",App (Just (27,15)-(27,67)) (Var (Just (27,15)-(27,26)) "List.append") [App (Just (27,27)-(27,58)) (Var (Just (27,28)-(27,36)) "List.rev") [App (Just (27,37)-(27,57)) (Var (Just (27,38)-(27,50)) "List.combine") [Var (Just (27,51)-(27,53)) "l1",Var (Just (27,54)-(27,56)) "l2"]],List (Just (27,59)-(27,67)) [Tuple (Just (27,60)-(27,66)) [Lit (Just (27,61)-(27,62)) (LI 0),Lit (Just (27,64)-(27,65)) (LI 0)]] Nothing])] (Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res")))
App (Just (29,2)-(29,34)) (Var (Just (29,2)-(29,12)) "removeZero") [App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]]
Lam (Just (31,19)-(38,27)) (VarPat (Just (31,19)-(31,20)) "i") (Lam (Just (31,21)-(38,27)) (VarPat (Just (31,21)-(31,22)) "l") (Case (Just (32,2)-(38,27)) (App (Just (32,8)-(32,18)) (Var (Just (32,8)-(32,16)) "List.rev") [Var (Just (32,17)-(32,18)) "l"]) [(ConPat (Just (33,4)-(33,6)) "[]" Nothing,Nothing,List (Just (33,10)-(33,12)) [] Nothing),(ConsPat (Just (34,4)-(34,8)) (VarPat (Just (34,4)-(34,5)) "h") (VarPat (Just (34,7)-(34,8)) "t"),Nothing,Let (Just (35,6)-(38,27)) Rec [(VarPat (Just (35,14)-(35,20)) "helper",Lam (Just (35,21)-(36,66)) (VarPat (Just (35,21)-(35,24)) "acc") (Lam (Just (35,25)-(36,66)) (VarPat (Just (35,25)-(35,26)) "v") (Ite (Just (36,8)-(36,66)) (Bop (Just (36,11)-(36,16)) Eq (Var (Just (36,11)-(36,12)) "v") (Lit (Just (36,15)-(36,16)) (LI 0))) (Var (Just (36,22)-(36,25)) "acc") (App (Just (36,31)-(36,66)) (Var (Just (36,31)-(36,37)) "helper") [ConApp (Just (36,38)-(36,57)) "::" (Just (Tuple (Just (36,39)-(36,56)) [Bop (Just (36,39)-(36,49)) Mod (Var (Just (36,40)-(36,41)) "v") (Lit (Just (36,46)-(36,48)) (LI 10)),Var (Just (36,53)-(36,56)) "acc"])) Nothing,Bop (Just (36,58)-(36,66)) Div (Var (Just (36,59)-(36,60)) "v") (Lit (Just (36,63)-(36,65)) (LI 10))])) Nothing) Nothing)] (App (Just (37,6)-(38,27)) (Var (Just (37,6)-(37,12)) "bigAdd") [App (Just (37,13)-(37,70)) (Var (Just (37,14)-(37,24)) "mulByDigit") [Var (Just (37,25)-(37,26)) "i",App (Just (37,27)-(37,69)) (Var (Just (37,28)-(37,36)) "List.rev") [App (Just (37,37)-(37,68)) (Var (Just (37,38)-(37,46)) "List.map") [Lam (Just (37,47)-(37,65)) (VarPat (Just (37,52)-(37,53)) "x") (Bop (Just (37,58)-(37,64)) Times (Var (Just (37,58)-(37,59)) "x") (Lit (Just (37,62)-(37,64)) (LI 10))) Nothing,Var (Just (37,66)-(37,67)) "t"]]],App (Just (38,8)-(38,27)) (Var (Just (38,9)-(38,15)) "helper") [List (Just (38,16)-(38,18)) [] Nothing,Bop (Just (38,19)-(38,26)) Times (Var (Just (38,20)-(38,21)) "h") (Var (Just (38,24)-(38,25)) "i")]]))]) Nothing) Nothing
Lit (Just (37,62)-(37,64)) (LI 10)
Var (Just (37,66)-(37,67)) "t"
App (Just (38,8)-(38,27)) (Var (Just (38,9)-(38,15)) "helper") [List (Just (38,16)-(38,18)) [] Nothing,Bop (Just (38,19)-(38,26)) Times (Var (Just (38,20)-(38,21)) "h") (Var (Just (38,24)-(38,25)) "i")]
Lam (Just (40,11)-(51,49)) (VarPat (Just (40,11)-(40,13)) "l1") (Lam (Just (40,14)-(51,49)) (VarPat (Just (40,14)-(40,16)) "l2") (Let (Just (41,2)-(51,49)) NonRec [(VarPat (Just (41,6)-(41,7)) "f",Lam (Just (41,8)-(43,73)) (VarPat (Just (41,8)-(41,9)) "a") (Lam (Just (41,10)-(43,73)) (VarPat (Just (41,10)-(41,11)) "x") (Case (Just (42,4)-(43,73)) (Var (Just (42,10)-(42,11)) "x") [(TuplePat (Just (43,7)-(43,10)) [VarPat (Just (43,7)-(43,8)) "k",VarPat (Just (43,9)-(43,10)) "v"],Nothing,Case (Just (43,15)-(43,73)) (Var (Just (43,22)-(43,23)) "a") [(TuplePat (Just (43,32)-(43,35)) [VarPat (Just (43,32)-(43,33)) "c",VarPat (Just (43,34)-(43,35)) "d"],Nothing,Tuple (Just (43,40)-(43,72)) [Var (Just (43,41)-(43,42)) "c",App (Just (43,44)-(43,71)) (Var (Just (43,45)-(43,51)) "bigAdd") [Var (Just (43,52)-(43,53)) "d",App (Just (43,54)-(43,70)) (Var (Just (43,55)-(43,65)) "mulByDigit") [Var (Just (43,66)-(43,67)) "k",Var (Just (43,68)-(43,69)) "v"]]])])]) Nothing) Nothing)] (Let (Just (44,2)-(51,49)) NonRec [(VarPat (Just (44,6)-(44,10)) "base",Tuple (Just (44,13)-(44,22)) [List (Just (44,14)-(44,16)) [] Nothing,List (Just (44,18)-(44,21)) [Lit (Just (44,19)-(44,20)) (LI 0)] Nothing])] (Let (Just (45,2)-(51,49)) NonRec [(VarPat (Just (45,6)-(45,10)) "args",Let (Just (46,4)-(50,30)) Rec [(VarPat (Just (46,12)-(46,18)) "helper",Lam (Just (46,19)-(49,74)) (VarPat (Just (46,19)-(46,22)) "acc") (Lam (Just (46,23)-(49,74)) (VarPat (Just (46,23)-(46,25)) "l1") (Lam (Just (46,26)-(49,74)) (VarPat (Just (46,26)-(46,28)) "l2") (Case (Just (47,6)-(49,74)) (Var (Just (47,12)-(47,14)) "l1") [(ConPat (Just (48,8)-(48,10)) "[]" Nothing,Nothing,Var (Just (48,14)-(48,17)) "acc"),(ConsPat (Just (49,8)-(49,12)) (VarPat (Just (49,8)-(49,9)) "h") (VarPat (Just (49,11)-(49,12)) "t"),Nothing,App (Just (49,16)-(49,74)) (Var (Just (49,16)-(49,22)) "helper") [ConApp (Just (49,23)-(49,39)) "::" (Just (Tuple (Just (49,24)-(49,38)) [Tuple (Just (49,24)-(49,31)) [Var (Just (49,25)-(49,26)) "h",Var (Just (49,28)-(49,30)) "l2"],Var (Just (49,35)-(49,38)) "acc"])) Nothing,App (Just (49,40)-(49,71)) (Var (Just (49,41)-(49,49)) "List.map") [Lam (Just (49,50)-(49,68)) (VarPat (Just (49,55)-(49,56)) "x") (Bop (Just (49,61)-(49,67)) Times (Var (Just (49,61)-(49,62)) "x") (Lit (Just (49,65)-(49,67)) (LI 10))) Nothing,Var (Just (49,69)-(49,70)) "t"],Var (Just (49,72)-(49,74)) "l2"])]) Nothing) Nothing) Nothing)] (App (Just (50,4)-(50,30)) (Var (Just (50,4)-(50,10)) "helper") [List (Just (50,11)-(50,13)) [] Nothing,App (Just (50,14)-(50,27)) (Var (Just (50,15)-(50,23)) "List.rev") [Var (Just (50,24)-(50,26)) "l1"],Var (Just (50,28)-(50,30)) "l2"]))] (Let (Just (51,2)-(51,49)) NonRec [(TuplePat (Just (51,7)-(51,12)) [WildPat (Just (51,7)-(51,8)),VarPat (Just (51,9)-(51,12)) "res"],App (Just (51,16)-(51,42)) (Var (Just (51,16)-(51,30)) "List.fold_left") [Var (Just (51,31)-(51,32)) "f",Var (Just (51,33)-(51,37)) "base",Var (Just (51,38)-(51,42)) "args"])] (Var (Just (51,46)-(51,49)) "res"))))) Nothing) Nothing
*)

(* typed spans
(2,14)-(2,64)
(5,2)-(7,77)
(9,19)-(10,69)
(12,11)-(29,34)
(15,6)-(25,60)
(26,4)-(28,51)
(29,2)-(29,34)
(31,19)-(38,27)
(37,62)-(37,64)
(37,66)-(37,67)
(38,8)-(38,27)
(40,11)-(51,49)
*)

(* correct types
int -> int -> int list
(int list * int list)
int list -> int list
int list -> int list -> int list
(int list * int list)
int list
int list
int -> int list -> int list
int
int list
int list
int list -> int list -> int list
*)

(* bad types
int list -> 'a -> 'b
'a
'a
'a
('a * 'b)
'a
'a
'a
'a
'a
'a
'a
*)
