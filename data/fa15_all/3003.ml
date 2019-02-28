
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
      then (1, (((j + k) + l) - 10))
      else (0, ((j + k) + l)) in
    let base = (0, []) in
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
(17,15)-(17,35)
(((j + k) + l) - 10) :: m
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG])))

(18,15)-(18,28)
((j + k) + l) :: m
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG])))

(19,4)-(21,51)
m
VarG

*)

(* changed exprs
ConApp (Just (17,15)-(17,42)) "::" (Just (Tuple (Just (17,16)-(17,41)) [Bop (Just (17,16)-(17,36)) Minus (Bop (Just (17,17)-(17,30)) Plus (Bop (Just (17,18)-(17,25)) Plus (Var (Just (17,19)-(17,20)) "j") (Var (Just (17,23)-(17,24)) "k")) (Var (Just (17,28)-(17,29)) "l")) (Lit (Just (17,33)-(17,35)) (LI 10)),Var (Just (17,40)-(17,41)) "m"])) Nothing
ConApp (Just (18,15)-(18,35)) "::" (Just (Tuple (Just (18,16)-(18,34)) [Bop (Just (18,16)-(18,29)) Plus (Bop (Just (18,17)-(18,24)) Plus (Var (Just (18,18)-(18,19)) "j") (Var (Just (18,22)-(18,23)) "k")) (Var (Just (18,27)-(18,28)) "l"),Var (Just (18,33)-(18,34)) "m"])) Nothing
Var (Just (18,33)-(18,34)) "m"
*)

(* typed spans
(17,15)-(17,42)
(18,15)-(18,35)
(18,33)-(18,34)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int
int
int list
*)
