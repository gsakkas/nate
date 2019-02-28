
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

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      let v = (x1 + x2) + c in ((a1 @ [c + 1]), (a2 @ [c + 1])) in
    let base = ([9], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  removeZero (add (padZero l1 l2));;


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

*)

(* changed spans
(26,6)-(28,63)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(29,16)-(29,19)
0
LitG

(29,22)-(29,23)
0
LitG

(30,4)-(31,60)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(31,4)-(31,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Let (Just (24,6)-(25,73)) NonRec [(TuplePat (Just (24,11)-(24,19)) [VarPat (Just (24,11)-(24,12)) "c",ConsPat (Just (24,13)-(24,19)) (VarPat (Just (24,13)-(24,15)) "a1") (VarPat (Just (24,17)-(24,19)) "a2")],Var (Just (24,23)-(24,24)) "a")] (Let (Just (25,6)-(25,73)) NonRec [(VarPat (Just (25,10)-(25,11)) "v",Bop (Just (25,14)-(25,27)) Plus (Bop (Just (25,14)-(25,23)) Plus (Var (Just (25,15)-(25,17)) "x1") (Var (Just (25,20)-(25,22)) "x2")) (Var (Just (25,26)-(25,27)) "c"))] (Tuple (Just (25,31)-(25,73)) [Bop (Just (25,32)-(25,40)) Div (Var (Just (25,33)-(25,34)) "v") (Lit (Just (25,37)-(25,39)) (LI 10)),App (Just (25,42)-(25,72)) (Var (Just (25,52)-(25,53)) "@") [List (Just (25,43)-(25,51)) [Bop (Just (25,44)-(25,50)) Div (Var (Just (25,44)-(25,45)) "v") (Lit (Just (25,48)-(25,50)) (LI 10))] Nothing,App (Just (25,54)-(25,71)) (Var (Just (25,66)-(25,67)) "@") [List (Just (25,55)-(25,65)) [Bop (Just (25,56)-(25,64)) Mod (Var (Just (25,56)-(25,57)) "v") (Lit (Just (25,62)-(25,64)) (LI 10))] Nothing,Var (Just (25,68)-(25,70)) "a2"]]]))
Lit (Just (26,16)-(26,17)) (LI 0)
Lit (Just (26,20)-(26,21)) (LI 0)
App (Just (27,15)-(27,44)) (Var (Just (27,15)-(27,23)) "List.rev") [App (Just (27,24)-(27,44)) (Var (Just (27,25)-(27,37)) "List.combine") [Var (Just (27,38)-(27,40)) "l1",Var (Just (27,41)-(27,43)) "l2"]]
Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res")
*)

(* typed spans
(24,6)-(25,73)
(26,16)-(26,17)
(26,20)-(26,21)
(27,15)-(27,44)
(28,4)-(28,51)
*)

(* correct types
(int * int list)
int
int
(int * int) list
int list
*)

(* bad types
(int list * int list)
int list
int
(int list * int list)
(int list * int list)
*)
