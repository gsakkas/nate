
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | [] -> [] | h::t -> let (j,k) = x in [0] in
    let base = [0] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,16)-(13,70)
let (j , k) = x in
let (l , m) = a in
if ((j + k) + l) > 9
then (1 , (((j + k) + l) - 10) :: m)
else (0 , ((j + k) + l) :: m)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(14,15)-(14,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Let (Just (14,6)-(18,36)) NonRec [(TuplePat (Just (14,11)-(14,14)) [VarPat (Just (14,11)-(14,12)) "j",VarPat (Just (14,13)-(14,14)) "k"],Var (Just (14,18)-(14,19)) "x")] (Let (Just (15,6)-(18,36)) NonRec [(TuplePat (Just (15,11)-(15,14)) [VarPat (Just (15,11)-(15,12)) "l",VarPat (Just (15,13)-(15,14)) "m"],Var (Just (15,18)-(15,19)) "a")] (Ite (Just (16,6)-(18,36)) (Bop (Just (16,9)-(16,26)) Gt (Bop (Just (16,9)-(16,22)) Plus (Bop (Just (16,10)-(16,17)) Plus (Var (Just (16,11)-(16,12)) "j") (Var (Just (16,15)-(16,16)) "k")) (Var (Just (16,20)-(16,21)) "l")) (Lit (Just (16,25)-(16,26)) (LI 9))) (Tuple (Just (17,11)-(17,43)) [Lit (Just (17,12)-(17,13)) (LI 1),ConApp (Just (17,15)-(17,42)) "::" (Just (Tuple (Just (17,16)-(17,41)) [Bop (Just (17,16)-(17,36)) Minus (Bop (Just (17,17)-(17,30)) Plus (Bop (Just (17,18)-(17,25)) Plus (Var (Just (17,19)-(17,20)) "j") (Var (Just (17,23)-(17,24)) "k")) (Var (Just (17,28)-(17,29)) "l")) (Lit (Just (17,33)-(17,35)) (LI 10)),Var (Just (17,40)-(17,41)) "m"])) Nothing]) (Tuple (Just (18,11)-(18,36)) [Lit (Just (18,12)-(18,13)) (LI 0),ConApp (Just (18,15)-(18,35)) "::" (Just (Tuple (Just (18,16)-(18,34)) [Bop (Just (18,16)-(18,29)) Plus (Bop (Just (18,17)-(18,24)) Plus (Var (Just (18,18)-(18,19)) "j") (Var (Just (18,22)-(18,23)) "k")) (Var (Just (18,27)-(18,28)) "l"),Var (Just (18,33)-(18,34)) "m"])) Nothing])))
Tuple (Just (19,15)-(19,22)) [Lit (Just (19,16)-(19,17)) (LI 0),List (Just (19,19)-(19,21)) [] Nothing]
*)

(* typed spans
(14,6)-(18,36)
(19,15)-(19,22)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
int list
int list
*)
