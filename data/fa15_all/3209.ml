
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (c,a1::a2) = a in
    let v = (x1 * x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
  let base = (0, [0]) in
  let args =
    let y = padZero (l1 l2) in
    let (ar1,ar2) = y in List.rev (List.combine ar1 ar2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(15,11)-(24,49)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(16,2)-(24,49)
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           (let (x1 , x2) = x in
            let (c , a1 :: a2) = a in
            let v = (x1 + x2) + c in
            (v / 10 , [v / 10] @ ([v mod 10] @ a2))) in
     let base = (0 , [0]) in
     let args =
       List.rev (List.combine l1
                              l2) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(19,12)-(19,21)
x1 + x2
BopG VarG VarG

(22,4)-(23,56)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(22,4)-(23,56)
List.rev
VarG

(22,21)-(22,23)
List.combine l1 l2
AppG (fromList [VarG])

(23,4)-(23,56)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(23,34)-(23,56)
removeZero
VarG

(23,34)-(23,56)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,52)-(23,55)
padZero
VarG

(24,2)-(24,49)
l1
VarG

(24,2)-(24,49)
l2
VarG

(24,2)-(24,49)
fun i ->
  fun l ->
    if i < 1
    then []
    else (match i with
          | 1 -> l
          | 10 -> l @ [0]
          | _ -> bigAdd l
                        (mulByDigit (i - 1) l))
LamG (LamG EmptyG)

(24,2)-(24,49)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (15,19)-(18,66)) (VarPat (Just (15,19)-(15,20)) "l") (Ite (Just (16,2)-(18,66)) (Bop (Just (16,5)-(16,11)) Eq (Var (Just (16,5)-(16,6)) "l") (List (Just (16,9)-(16,11)) [] Nothing)) (List (Just (17,7)-(17,9)) [] Nothing) (Let (Just (18,7)-(18,66)) NonRec [(ConsPat (Just (18,12)-(18,16)) (VarPat (Just (18,12)-(18,13)) "h") (VarPat (Just (18,15)-(18,16)) "t"),Var (Just (18,19)-(18,20)) "l")] (Case (Just (18,24)-(18,65)) (Var (Just (18,30)-(18,31)) "h") [(LitPat (Just (18,39)-(18,40)) (LI 0),Nothing,App (Just (18,44)-(18,56)) (Var (Just (18,44)-(18,54)) "removeZero") [Var (Just (18,55)-(18,56)) "t"]),(WildPat (Just (18,59)-(18,60)),Nothing,Var (Just (18,64)-(18,65)) "l")]))) Nothing
Let (Just (21,2)-(29,34)) NonRec [(VarPat (Just (21,6)-(21,9)) "add",Lam (Just (21,11)-(28,51)) (TuplePat (Just (21,11)-(21,16)) [VarPat (Just (21,11)-(21,13)) "l1",VarPat (Just (21,14)-(21,16)) "l2"]) (Let (Just (22,4)-(28,51)) NonRec [(VarPat (Just (22,8)-(22,9)) "f",Lam (Just (22,10)-(25,73)) (VarPat (Just (22,10)-(22,11)) "a") (Lam (Just (22,12)-(25,73)) (VarPat (Just (22,12)-(22,13)) "x") (Let (Just (23,6)-(25,73)) NonRec [(TuplePat (Just (23,11)-(23,16)) [VarPat (Just (23,11)-(23,13)) "x1",VarPat (Just (23,14)-(23,16)) "x2"],Var (Just (23,20)-(23,21)) "x")] (Let (Just (24,6)-(25,73)) NonRec [(TuplePat (Just (24,11)-(24,19)) [VarPat (Just (24,11)-(24,12)) "c",ConsPat (Just (24,13)-(24,19)) (VarPat (Just (24,13)-(24,15)) "a1") (VarPat (Just (24,17)-(24,19)) "a2")],Var (Just (24,23)-(24,24)) "a")] (Let (Just (25,6)-(25,73)) NonRec [(VarPat (Just (25,10)-(25,11)) "v",Bop (Just (25,14)-(25,27)) Plus (Bop (Just (25,14)-(25,23)) Plus (Var (Just (25,15)-(25,17)) "x1") (Var (Just (25,20)-(25,22)) "x2")) (Var (Just (25,26)-(25,27)) "c"))] (Tuple (Just (25,31)-(25,73)) [Bop (Just (25,32)-(25,40)) Div (Var (Just (25,33)-(25,34)) "v") (Lit (Just (25,37)-(25,39)) (LI 10)),App (Just (25,42)-(25,72)) (Var (Just (25,52)-(25,53)) "@") [List (Just (25,43)-(25,51)) [Bop (Just (25,44)-(25,50)) Div (Var (Just (25,44)-(25,45)) "v") (Lit (Just (25,48)-(25,50)) (LI 10))] Nothing,App (Just (25,54)-(25,71)) (Var (Just (25,66)-(25,67)) "@") [List (Just (25,55)-(25,65)) [Bop (Just (25,56)-(25,64)) Mod (Var (Just (25,56)-(25,57)) "v") (Lit (Just (25,62)-(25,64)) (LI 10))] Nothing,Var (Just (25,68)-(25,70)) "a2"]]])))) Nothing) Nothing)] (Let (Just (26,4)-(28,51)) NonRec [(VarPat (Just (26,8)-(26,12)) "base",Tuple (Just (26,15)-(26,23)) [Lit (Just (26,16)-(26,17)) (LI 0),List (Just (26,19)-(26,22)) [Lit (Just (26,20)-(26,21)) (LI 0)] Nothing])] (Let (Just (27,4)-(28,51)) NonRec [(VarPat (Just (27,8)-(27,12)) "args",App (Just (27,15)-(27,44)) (Var (Just (27,15)-(27,23)) "List.rev") [App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]])] (Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res"))))) Nothing)] (App (Just (29,2)-(29,34)) (Var (Just (29,2)-(29,12)) "removeZero") [App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]])
Bop (Just (25,14)-(25,23)) Plus (Var (Just (25,15)-(25,17)) "x1") (Var (Just (25,20)-(25,22)) "x2")
App (Just (27,15)-(27,44)) (Var (Just (27,15)-(27,23)) "List.rev") [App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]]
Var (Just (27,15)-(27,23)) "List.rev"
App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]
Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res")
Var (Just (29,2)-(29,12)) "removeZero"
App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]
Var (Just (29,19)-(29,26)) "padZero"
Var (Just (29,27)-(29,29)) "l1"
Var (Just (29,30)-(29,32)) "l2"
Lam (Just (31,19)-(38,44)) (VarPat (Just (31,19)-(31,20)) "i") (Lam (Just (31,21)-(38,44)) (VarPat (Just (31,21)-(31,22)) "l") (Ite (Just (32,2)-(38,44)) (Bop (Just (32,5)-(32,10)) Lt (Var (Just (32,5)-(32,6)) "i") (Lit (Just (32,9)-(32,10)) (LI 1))) (List (Just (33,7)-(33,9)) [] Nothing) (Case (Just (35,4)-(38,44)) (Var (Just (35,11)-(35,12)) "i") [(LitPat (Just (36,7)-(36,8)) (LI 1),Nothing,Var (Just (36,12)-(36,13)) "l"),(LitPat (Just (37,7)-(37,9)) (LI 10),Nothing,App (Just (37,13)-(37,20)) (Var (Just (37,15)-(37,16)) "@") [Var (Just (37,13)-(37,14)) "l",List (Just (37,17)-(37,20)) [Lit (Just (37,18)-(37,19)) (LI 0)] Nothing]),(WildPat (Just (38,7)-(38,8)),Nothing,App (Just (38,12)-(38,43)) (Var (Just (38,12)-(38,18)) "bigAdd") [Var (Just (38,19)-(38,20)) "l",App (Just (38,21)-(38,43)) (Var (Just (38,22)-(38,32)) "mulByDigit") [Bop (Just (38,33)-(38,40)) Minus (Var (Just (38,34)-(38,35)) "i") (Lit (Just (38,38)-(38,39)) (LI 1)),Var (Just (38,41)-(38,42)) "l"]])])) Nothing) Nothing
Lam (Just (40,11)-(45,66)) (VarPat (Just (40,11)-(40,13)) "l1") (Lam (Just (40,14)-(45,66)) (VarPat (Just (40,14)-(40,16)) "l2") (Let (Just (41,2)-(45,66)) NonRec [(VarPat (Just (41,6)-(41,7)) "f",Lam (Just (41,8)-(43,66)) (VarPat (Just (41,8)-(41,9)) "a") (Lam (Just (41,10)-(43,66)) (VarPat (Just (41,10)-(41,11)) "x") (Let (Just (42,4)-(43,66)) NonRec [(TuplePat (Just (42,9)-(42,13)) [VarPat (Just (42,9)-(42,10)) "c",VarPat (Just (42,11)-(42,13)) "a'"],Var (Just (42,17)-(42,18)) "a")] (Let (Just (43,4)-(43,66)) NonRec [(VarPat (Just (43,8)-(43,9)) "m",App (Just (43,12)-(43,27)) (Var (Just (43,12)-(43,22)) "mulByDigit") [Var (Just (43,23)-(43,24)) "x",Var (Just (43,25)-(43,27)) "l2"])] (Let (Just (43,31)-(43,66)) NonRec [(VarPat (Just (43,35)-(43,36)) "s",App (Just (43,39)-(43,50)) (Var (Just (43,39)-(43,45)) "bigAdd") [Var (Just (43,46)-(43,47)) "m",Var (Just (43,48)-(43,50)) "a'"])] (Tuple (Just (43,54)-(43,66)) [Bop (Just (43,55)-(43,62)) Plus (Var (Just (43,56)-(43,57)) "c") (Lit (Just (43,60)-(43,61)) (LI 1)),Var (Just (43,64)-(43,65)) "s"])))) Nothing) Nothing)] (Let (Just (44,2)-(45,66)) NonRec [(VarPat (Just (44,6)-(44,10)) "base",Tuple (Just (44,13)-(44,21)) [Lit (Just (44,14)-(44,15)) (LI 0),List (Just (44,17)-(44,20)) [Lit (Just (44,18)-(44,19)) (LI 0)] Nothing])] (Let (Just (45,2)-(45,66)) NonRec [(VarPat (Just (45,6)-(45,10)) "args",Var (Just (45,13)-(45,15)) "l1")] (Let (Just (45,19)-(45,66)) NonRec [(TuplePat (Just (45,24)-(45,29)) [WildPat (Just (45,24)-(45,25)),VarPat (Just (45,26)-(45,29)) "res"],App (Just (45,33)-(45,59)) (Var (Just (45,33)-(45,47)) "List.fold_left") [Var (Just (45,48)-(45,49)) "f",Var (Just (45,50)-(45,54)) "base",Var (Just (45,55)-(45,59)) "args"])] (Var (Just (45,63)-(45,66)) "res"))))) Nothing) Nothing
*)

(* typed spans
(15,19)-(18,66)
(21,2)-(29,34)
(25,14)-(25,23)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(28,4)-(28,51)
(29,2)-(29,12)
(29,13)-(29,34)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
(31,19)-(38,44)
(40,11)-(45,66)
*)

(* correct types
int list -> int list
int list
int
(int * int) list
(int * int) list -> (int * int) list
(int * int) list
int list
int list -> int list
int list
int list -> int list -> (int list * int list)
int list
int list
int -> int list -> int list
int list -> int list -> int list
*)

(* bad types
('a -> int list) -> 'a -> int list
int list
int
(int * int) list
(int * int) list
'a -> int list
(int * int) list
(int * int) list
(int * int) list
int list
int list
int list
int list
int list
*)
