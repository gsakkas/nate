
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "" in
    let base = (0, 0) in
    let args = [(l1, l2)] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,4)-(15,76)
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,19)-(14,20)
let base = (0 , []) in
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(15,4)-(15,76)
[]
ListG EmptyG

(15,15)-(15,25)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Let (Just (14,6)-(17,71)) NonRec [(TuplePat (Just (14,11)-(14,20)) [VarPat (Just (14,11)-(14,16)) "carry",VarPat (Just (14,17)-(14,20)) "num"],Var (Just (14,24)-(14,25)) "a")] (Let (Just (15,6)-(17,71)) NonRec [(TuplePat (Just (15,11)-(15,18)) [VarPat (Just (15,11)-(15,14)) "l1'",VarPat (Just (15,15)-(15,18)) "l2'"],Var (Just (15,22)-(15,23)) "x")] (Let (Just (16,6)-(17,71)) NonRec [(VarPat (Just (16,10)-(16,15)) "addit",Bop (Just (16,18)-(16,37)) Plus (Bop (Just (16,18)-(16,29)) Plus (Var (Just (16,19)-(16,22)) "l1'") (Var (Just (16,25)-(16,28)) "l2'")) (Var (Just (16,32)-(16,37)) "carry"))] (Tuple (Just (17,6)-(17,71)) [Ite (Just (17,7)-(17,47)) (Bop (Just (17,11)-(17,21)) Gt (Var (Just (17,11)-(17,16)) "addit") (Lit (Just (17,19)-(17,21)) (LI 10))) (Bop (Just (17,27)-(17,39)) Mod (Var (Just (17,27)-(17,32)) "addit") (Lit (Just (17,37)-(17,39)) (LI 10))) (Lit (Just (17,45)-(17,46)) (LI 0)),ConApp (Just (17,49)-(17,70)) "::" (Just (Tuple (Just (17,50)-(17,69)) [Bop (Just (17,50)-(17,62)) Div (Var (Just (17,51)-(17,56)) "addit") (Lit (Just (17,59)-(17,61)) (LI 10)),Var (Just (17,66)-(17,69)) "num"])) Nothing])))
Let (Just (18,4)-(20,51)) NonRec [(VarPat (Just (18,8)-(18,12)) "base",Tuple (Just (18,15)-(18,22)) [Lit (Just (18,16)-(18,17)) (LI 0),List (Just (18,19)-(18,21)) [] Nothing])] (Let (Just (19,4)-(20,51)) NonRec [(VarPat (Just (19,8)-(19,12)) "args",App (Just (19,15)-(19,33)) (Var (Just (19,15)-(19,27)) "List.combine") [Var (Just (19,28)-(19,30)) "l1",Var (Just (19,31)-(19,33)) "l2"])] (Let (Just (20,4)-(20,51)) NonRec [(TuplePat (Just (20,9)-(20,14)) [WildPat (Just (20,9)-(20,10)),VarPat (Just (20,11)-(20,14)) "res"],App (Just (20,18)-(20,44)) (Var (Just (20,18)-(20,32)) "List.fold_left") [Var (Just (20,33)-(20,34)) "f",Var (Just (20,35)-(20,39)) "base",Var (Just (20,40)-(20,44)) "args"])] (Var (Just (20,48)-(20,51)) "res")))
List (Just (18,19)-(18,21)) [] Nothing
App (Just (19,15)-(19,33)) (Var (Just (19,15)-(19,27)) "List.combine") [Var (Just (19,28)-(19,30)) "l1",Var (Just (19,31)-(19,33)) "l2"]
*)

(* typed spans
(14,6)-(17,71)
(18,4)-(20,51)
(18,19)-(18,21)
(19,15)-(19,33)
*)

(* correct types
(int * int list)
int list
int list
(int * int) list
*)

(* bad types
int
int
int
(int list * int list) list
*)
