
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

let bigMul l1 l2 =
  let f a x = bigAdd (mulByDigit x l2) a in
  let base = [0] in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


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
(34,7)-(34,69)
match i with
| 1 -> l
| 10 -> l @ [0]
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(37,14)-(37,40)
let (c , a') = a in
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(38,13)-(38,16)
(0 , [0])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Case (Just (35,4)-(38,44)) (Var (Just (35,11)-(35,12)) "i") [(LitPat (Just (36,7)-(36,8)) (LI 1),Nothing,Var (Just (36,12)-(36,13)) "l"),(LitPat (Just (37,7)-(37,9)) (LI 10),Nothing,App (Just (37,13)-(37,20)) (Var (Just (37,15)-(37,16)) "@") [Var (Just (37,13)-(37,14)) "l",List (Just (37,17)-(37,20)) [Lit (Just (37,18)-(37,19)) (LI 0)] Nothing]),(WildPat (Just (38,7)-(38,8)),Nothing,App (Just (38,12)-(38,43)) (Var (Just (38,12)-(38,18)) "bigAdd") [Var (Just (38,19)-(38,20)) "l",App (Just (38,21)-(38,43)) (Var (Just (38,22)-(38,32)) "mulByDigit") [Bop (Just (38,33)-(38,40)) Minus (Var (Just (38,34)-(38,35)) "i") (Lit (Just (38,38)-(38,39)) (LI 1)),Var (Just (38,41)-(38,42)) "l"]])]
Let (Just (42,4)-(43,66)) NonRec [(TuplePat (Just (42,9)-(42,13)) [VarPat (Just (42,9)-(42,10)) "c",VarPat (Just (42,11)-(42,13)) "a'"],Var (Just (42,17)-(42,18)) "a")] (Let (Just (43,4)-(43,66)) NonRec [(VarPat (Just (43,8)-(43,9)) "m",App (Just (43,12)-(43,27)) (Var (Just (43,12)-(43,22)) "mulByDigit") [Var (Just (43,23)-(43,24)) "x",Var (Just (43,25)-(43,27)) "l2"])] (Let (Just (43,31)-(43,66)) NonRec [(VarPat (Just (43,35)-(43,36)) "s",App (Just (43,39)-(43,50)) (Var (Just (43,39)-(43,45)) "bigAdd") [Var (Just (43,46)-(43,47)) "m",Var (Just (43,48)-(43,50)) "a'"])] (Tuple (Just (43,54)-(43,66)) [Bop (Just (43,55)-(43,62)) Plus (Var (Just (43,56)-(43,57)) "c") (Lit (Just (43,60)-(43,61)) (LI 1)),Var (Just (43,64)-(43,65)) "s"])))
Tuple (Just (44,13)-(44,21)) [Lit (Just (44,14)-(44,15)) (LI 0),List (Just (44,17)-(44,20)) [Lit (Just (44,18)-(44,19)) (LI 0)] Nothing]
*)

(* typed spans
(35,4)-(38,44)
(42,4)-(43,66)
(44,13)-(44,21)
*)

(* correct types
int list
(int * int list)
(int * int list)
*)

(* bad types
int list
int list
int list
*)
