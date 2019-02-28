
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      (([c + 1] @ [v / 10]), (s' @ ([s + c'] @ [v mod 10]))) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;


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
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

*)

(* changed spans
(15,38)-(15,40)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(21,6)-(25,60)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(26,16)-(26,22)
0
LitG

(26,25)-(26,26)
0
LitG

(26,25)-(26,26)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(28,4)-(28,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(28,56)-(28,59)
removeZero
VarG

(28,56)-(28,59)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(32,2)-(32,72)
if i < 1
then []
else (match i with
      | 1 -> l
      | _ -> bigAdd l
                    (mulByDigit (i - 1) l))
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Lam (Just (15,19)-(18,66)) (VarPat (Just (15,19)-(15,20)) "l") (Ite (Just (16,2)-(18,66)) (Bop (Just (16,5)-(16,11)) Eq (Var (Just (16,5)-(16,6)) "l") (List (Just (16,9)-(16,11)) [] Nothing)) (List (Just (17,7)-(17,9)) [] Nothing) (Let (Just (18,7)-(18,66)) NonRec [(ConsPat (Just (18,12)-(18,16)) (VarPat (Just (18,12)-(18,13)) "h") (VarPat (Just (18,15)-(18,16)) "t"),Var (Just (18,19)-(18,20)) "l")] (Case (Just (18,24)-(18,65)) (Var (Just (18,30)-(18,31)) "h") [(LitPat (Just (18,39)-(18,40)) (LI 0),Nothing,App (Just (18,44)-(18,56)) (Var (Just (18,44)-(18,54)) "removeZero") [Var (Just (18,55)-(18,56)) "t"]),(WildPat (Just (18,59)-(18,60)),Nothing,Var (Just (18,64)-(18,65)) "l")]))) Nothing
Let (Just (24,6)-(25,73)) NonRec [(TuplePat (Just (24,11)-(24,19)) [VarPat (Just (24,11)-(24,12)) "c",ConsPat (Just (24,13)-(24,19)) (VarPat (Just (24,13)-(24,15)) "a1") (VarPat (Just (24,17)-(24,19)) "a2")],Var (Just (24,23)-(24,24)) "a")] (Let (Just (25,6)-(25,73)) NonRec [(VarPat (Just (25,10)-(25,11)) "v",Bop (Just (25,14)-(25,27)) Plus (Bop (Just (25,14)-(25,23)) Plus (Var (Just (25,15)-(25,17)) "x1") (Var (Just (25,20)-(25,22)) "x2")) (Var (Just (25,26)-(25,27)) "c"))] (Tuple (Just (25,31)-(25,73)) [Bop (Just (25,32)-(25,40)) Div (Var (Just (25,33)-(25,34)) "v") (Lit (Just (25,37)-(25,39)) (LI 10)),App (Just (25,42)-(25,72)) (Var (Just (25,52)-(25,53)) "@") [List (Just (25,43)-(25,51)) [Bop (Just (25,44)-(25,50)) Div (Var (Just (25,44)-(25,45)) "v") (Lit (Just (25,48)-(25,50)) (LI 10))] Nothing,App (Just (25,54)-(25,71)) (Var (Just (25,66)-(25,67)) "@") [List (Just (25,55)-(25,65)) [Bop (Just (25,56)-(25,64)) Mod (Var (Just (25,56)-(25,57)) "v") (Lit (Just (25,62)-(25,64)) (LI 10))] Nothing,Var (Just (25,68)-(25,70)) "a2"]]]))
Lit (Just (26,16)-(26,17)) (LI 0)
Lit (Just (26,20)-(26,21)) (LI 0)
App (Just (27,15)-(27,44)) (Var (Just (27,15)-(27,23)) "List.rev") [App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]]
Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res")
Var (Just (29,2)-(29,12)) "removeZero"
App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]
Ite (Just (32,2)-(34,69)) (Bop (Just (32,5)-(32,10)) Lt (Var (Just (32,5)-(32,6)) "i") (Lit (Just (32,9)-(32,10)) (LI 1))) (List (Just (33,7)-(33,9)) [] Nothing) (Case (Just (34,7)-(34,69)) (Var (Just (34,14)-(34,15)) "i") [(LitPat (Just (34,23)-(34,24)) (LI 1),Nothing,Var (Just (34,28)-(34,29)) "l"),(WildPat (Just (34,32)-(34,33)),Nothing,App (Just (34,37)-(34,68)) (Var (Just (34,37)-(34,43)) "bigAdd") [Var (Just (34,44)-(34,45)) "l",App (Just (34,46)-(34,68)) (Var (Just (34,47)-(34,57)) "mulByDigit") [Bop (Just (34,58)-(34,65)) Minus (Var (Just (34,59)-(34,60)) "i") (Lit (Just (34,63)-(34,64)) (LI 1)),Var (Just (34,66)-(34,67)) "l"]])])
*)

(* typed spans
(15,19)-(18,66)
(24,6)-(25,73)
(26,16)-(26,17)
(26,20)-(26,21)
(27,15)-(27,44)
(28,4)-(28,51)
(29,2)-(29,12)
(29,13)-(29,34)
(32,2)-(34,69)
*)

(* correct types
int list -> int list
(int * int list)
int
int
(int * int) list
int list
int list -> int list
int list
int list
*)

(* bad types
int list
(int list * int list)
int list
int
int
(int list * int list)
int list
int list
int list
*)
