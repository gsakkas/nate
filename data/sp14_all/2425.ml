
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      let lastDigit = prod / 10 in
      let firstDigit = prod mod 10 in
      let ret = mulByDigit (i t) in
      (match ret with
       | [] -> 0
       | h2::t2 ->
           if h2 > 10
           then
             let temp = h2 in
             (if prod > 10
              then [lastDigit; firstDigit + temp]
              else firstDigit :: t));;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let mult i l =
    let f a x =
      let (carryOver,rest) = a in
      let num = carryOver + (x * i) in
      let secondDigit = num mod 10 in
      let carryOver = num / 10 in
      let result = secondDigit :: rest in (carryOver, rest) in
    let base = (0, []) in
    let (carryOver,rest) = List.fold_left f base (List.rev l) in carryOver ::
      rest in
  removeZero (mult i l);;

*)

(* changed spans
(2,19)-(18,36)
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(6,21)-(6,22)
fun i ->
  fun l ->
    (let mult =
       fun i ->
         fun l ->
           (let f =
              fun a ->
                fun x ->
                  (let (carryOver , rest) = a in
                   let num =
                     carryOver + (x * i) in
                   let secondDigit =
                     num mod 10 in
                   let carryOver = num / 10 in
                   let result =
                     secondDigit :: rest in
                   (carryOver , rest)) in
            let base = (0 , []) in
            let (carryOver , rest) =
              List.fold_left f base
                             (List.rev l) in
            carryOver :: rest) in
     removeZero (mult i l))
LamG (LamG EmptyG)

(7,6)-(18,36)
let secondDigit =
  num mod 10 in
let carryOver = num / 10 in
let result =
  secondDigit :: rest in
(carryOver , rest)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,16)-(9,32)
let base = (0 , []) in
let (carryOver , rest) =
  List.fold_left f base
                 (List.rev l) in
carryOver :: rest
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,16)-(9,26)
List.rev
VarG

(9,27)-(9,32)
l
VarG

(9,27)-(9,32)
carryOver :: rest
ConAppG (Just (TupleG (fromList [VarG])))

(9,28)-(9,29)
removeZero
VarG

(9,28)-(9,29)
mult i l
AppG (fromList [VarG])

(10,6)-(18,36)
l
VarG

*)

(* changed exprs
Lam (Just (2,19)-(3,69)) (VarPat (Just (2,19)-(2,20)) "l") (Case (Just (3,2)-(3,69)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,32)) (VarPat (Just (3,28)-(3,29)) "h") (VarPat (Just (3,31)-(3,32)) "t"),Nothing,Ite (Just (3,36)-(3,69)) (Bop (Just (3,39)-(3,44)) Eq (Var (Just (3,39)-(3,40)) "h") (Lit (Just (3,43)-(3,44)) (LI 0))) (App (Just (3,50)-(3,62)) (Var (Just (3,50)-(3,60)) "removeZero") [Var (Just (3,61)-(3,62)) "t"]) (Var (Just (3,68)-(3,69)) "l"))]) Nothing
Lam (Just (5,19)-(16,23)) (VarPat (Just (5,19)-(5,20)) "i") (Lam (Just (5,21)-(16,23)) (VarPat (Just (5,21)-(5,22)) "l") (Let (Just (6,2)-(16,23)) NonRec [(VarPat (Just (6,6)-(6,10)) "mult",Lam (Just (6,11)-(15,10)) (VarPat (Just (6,11)-(6,12)) "i") (Lam (Just (6,13)-(15,10)) (VarPat (Just (6,13)-(6,14)) "l") (Let (Just (7,4)-(15,10)) NonRec [(VarPat (Just (7,8)-(7,9)) "f",Lam (Just (7,10)-(12,59)) (VarPat (Just (7,10)-(7,11)) "a") (Lam (Just (7,12)-(12,59)) (VarPat (Just (7,12)-(7,13)) "x") (Let (Just (8,6)-(12,59)) NonRec [(TuplePat (Just (8,11)-(8,25)) [VarPat (Just (8,11)-(8,20)) "carryOver",VarPat (Just (8,21)-(8,25)) "rest"],Var (Just (8,29)-(8,30)) "a")] (Let (Just (9,6)-(12,59)) NonRec [(VarPat (Just (9,10)-(9,13)) "num",Bop (Just (9,16)-(9,35)) Plus (Var (Just (9,16)-(9,25)) "carryOver") (Bop (Just (9,28)-(9,35)) Times (Var (Just (9,29)-(9,30)) "x") (Var (Just (9,33)-(9,34)) "i")))] (Let (Just (10,6)-(12,59)) NonRec [(VarPat (Just (10,10)-(10,21)) "secondDigit",Bop (Just (10,24)-(10,34)) Mod (Var (Just (10,24)-(10,27)) "num") (Lit (Just (10,32)-(10,34)) (LI 10)))] (Let (Just (11,6)-(12,59)) NonRec [(VarPat (Just (11,10)-(11,19)) "carryOver",Bop (Just (11,22)-(11,30)) Div (Var (Just (11,22)-(11,25)) "num") (Lit (Just (11,28)-(11,30)) (LI 10)))] (Let (Just (12,6)-(12,59)) NonRec [(VarPat (Just (12,10)-(12,16)) "result",ConApp (Just (12,19)-(12,38)) "::" (Just (Tuple (Just (12,19)-(12,38)) [Var (Just (12,19)-(12,30)) "secondDigit",Var (Just (12,34)-(12,38)) "rest"])) Nothing)] (Tuple (Just (12,42)-(12,59)) [Var (Just (12,43)-(12,52)) "carryOver",Var (Just (12,54)-(12,58)) "rest"])))))) Nothing) Nothing)] (Let (Just (13,4)-(15,10)) NonRec [(VarPat (Just (13,8)-(13,12)) "base",Tuple (Just (13,15)-(13,22)) [Lit (Just (13,16)-(13,17)) (LI 0),List (Just (13,19)-(13,21)) [] Nothing])] (Let (Just (14,4)-(15,10)) NonRec [(TuplePat (Just (14,9)-(14,23)) [VarPat (Just (14,9)-(14,18)) "carryOver",VarPat (Just (14,19)-(14,23)) "rest"],App (Just (14,27)-(14,61)) (Var (Just (14,27)-(14,41)) "List.fold_left") [Var (Just (14,42)-(14,43)) "f",Var (Just (14,44)-(14,48)) "base",App (Just (14,49)-(14,61)) (Var (Just (14,50)-(14,58)) "List.rev") [Var (Just (14,59)-(14,60)) "l"]])] (ConApp (Just (14,65)-(15,10)) "::" (Just (Tuple (Just (14,65)-(15,10)) [Var (Just (14,65)-(14,74)) "carryOver",Var (Just (15,6)-(15,10)) "rest"])) Nothing)))) Nothing) Nothing)] (App (Just (16,2)-(16,23)) (Var (Just (16,2)-(16,12)) "removeZero") [App (Just (16,13)-(16,23)) (Var (Just (16,14)-(16,18)) "mult") [Var (Just (16,19)-(16,20)) "i",Var (Just (16,21)-(16,22)) "l"]])) Nothing) Nothing
Let (Just (10,6)-(12,59)) NonRec [(VarPat (Just (10,10)-(10,21)) "secondDigit",Bop (Just (10,24)-(10,34)) Mod (Var (Just (10,24)-(10,27)) "num") (Lit (Just (10,32)-(10,34)) (LI 10)))] (Let (Just (11,6)-(12,59)) NonRec [(VarPat (Just (11,10)-(11,19)) "carryOver",Bop (Just (11,22)-(11,30)) Div (Var (Just (11,22)-(11,25)) "num") (Lit (Just (11,28)-(11,30)) (LI 10)))] (Let (Just (12,6)-(12,59)) NonRec [(VarPat (Just (12,10)-(12,16)) "result",ConApp (Just (12,19)-(12,38)) "::" (Just (Tuple (Just (12,19)-(12,38)) [Var (Just (12,19)-(12,30)) "secondDigit",Var (Just (12,34)-(12,38)) "rest"])) Nothing)] (Tuple (Just (12,42)-(12,59)) [Var (Just (12,43)-(12,52)) "carryOver",Var (Just (12,54)-(12,58)) "rest"])))
Let (Just (13,4)-(15,10)) NonRec [(VarPat (Just (13,8)-(13,12)) "base",Tuple (Just (13,15)-(13,22)) [Lit (Just (13,16)-(13,17)) (LI 0),List (Just (13,19)-(13,21)) [] Nothing])] (Let (Just (14,4)-(15,10)) NonRec [(TuplePat (Just (14,9)-(14,23)) [VarPat (Just (14,9)-(14,18)) "carryOver",VarPat (Just (14,19)-(14,23)) "rest"],App (Just (14,27)-(14,61)) (Var (Just (14,27)-(14,41)) "List.fold_left") [Var (Just (14,42)-(14,43)) "f",Var (Just (14,44)-(14,48)) "base",App (Just (14,49)-(14,61)) (Var (Just (14,50)-(14,58)) "List.rev") [Var (Just (14,59)-(14,60)) "l"]])] (ConApp (Just (14,65)-(15,10)) "::" (Just (Tuple (Just (14,65)-(15,10)) [Var (Just (14,65)-(14,74)) "carryOver",Var (Just (15,6)-(15,10)) "rest"])) Nothing))
Var (Just (14,50)-(14,58)) "List.rev"
Var (Just (14,59)-(14,60)) "l"
ConApp (Just (14,65)-(15,10)) "::" (Just (Tuple (Just (14,65)-(15,10)) [Var (Just (14,65)-(14,74)) "carryOver",Var (Just (15,6)-(15,10)) "rest"])) Nothing
Var (Just (16,2)-(16,12)) "removeZero"
App (Just (16,13)-(16,23)) (Var (Just (16,14)-(16,18)) "mult") [Var (Just (16,19)-(16,20)) "i",Var (Just (16,21)-(16,22)) "l"]
Var (Just (16,21)-(16,22)) "l"
*)

(* typed spans
(2,19)-(3,69)
(5,19)-(16,23)
(10,6)-(12,59)
(13,4)-(15,10)
(14,50)-(14,58)
(14,59)-(14,60)
(14,65)-(15,10)
(16,2)-(16,12)
(16,13)-(16,23)
(16,21)-(16,22)
*)

(* correct types
int list -> int list
int -> int list -> int list
(int * int list)
int list
int list -> int list
int list
int list
int list -> int list
int list
int list
*)

(* bad types
int -> int list -> 'a list
int
int
int list
int -> int list
int
int
int
int
int
*)
