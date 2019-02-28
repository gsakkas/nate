
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([0], ((x1 + x2) :: a)) in
    let base = [(0, 0)] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ((if ((a1 + x1) + x2) >= 10 then 1 else 0), (((a1 + x1) + x2) :: a2)) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,35)-(14,58)
let (a1 , a2) = a in
(if ((a1 + x1) + x2) >= 10
 then 1
 else 0 , ((a1 + x1) + x2) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(15,15)-(15,23)
(0 , [0])
TupleG (fromList [LitG,ListG EmptyG])

(15,15)-(15,23)
0
LitG

(15,15)-(15,23)
[0]
ListG LitG

*)

(* changed exprs
Let (Just (16,6)-(17,75)) NonRec [(TuplePat (Just (16,11)-(16,16)) [VarPat (Just (16,11)-(16,13)) "a1",VarPat (Just (16,14)-(16,16)) "a2"],Var (Just (16,20)-(16,21)) "a")] (Tuple (Just (17,6)-(17,75)) [Ite (Just (17,7)-(17,48)) (Bop (Just (17,11)-(17,33)) Ge (Bop (Just (17,11)-(17,27)) Plus (Bop (Just (17,12)-(17,21)) Plus (Var (Just (17,13)-(17,15)) "a1") (Var (Just (17,18)-(17,20)) "x1")) (Var (Just (17,24)-(17,26)) "x2")) (Lit (Just (17,31)-(17,33)) (LI 10))) (Lit (Just (17,39)-(17,40)) (LI 1)) (Lit (Just (17,46)-(17,47)) (LI 0)),ConApp (Just (17,50)-(17,74)) "::" (Just (Tuple (Just (17,51)-(17,73)) [Bop (Just (17,51)-(17,67)) Plus (Bop (Just (17,52)-(17,61)) Plus (Var (Just (17,53)-(17,55)) "a1") (Var (Just (17,58)-(17,60)) "x1")) (Var (Just (17,64)-(17,66)) "x2"),Var (Just (17,71)-(17,73)) "a2"])) Nothing])
Tuple (Just (18,15)-(18,23)) [Lit (Just (18,16)-(18,17)) (LI 0),List (Just (18,19)-(18,22)) [Lit (Just (18,20)-(18,21)) (LI 0)] Nothing]
Lit (Just (18,16)-(18,17)) (LI 0)
List (Just (18,19)-(18,22)) [Lit (Just (18,20)-(18,21)) (LI 0)] Nothing
*)

(* typed spans
(16,6)-(17,75)
(18,15)-(18,23)
(18,16)-(18,17)
(18,19)-(18,22)
*)

(* correct types
(int * int list)
(int * int list)
int
int list
*)

(* bad types
(int list * int list)
(int * int) list
(int * int) list
(int * int) list
*)
