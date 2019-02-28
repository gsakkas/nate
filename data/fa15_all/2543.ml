
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = let (a1,a2) = a in bigAdd a2 ((mulByDigit (x l1) 10) ** a1) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let rec appZero x l = if x > 0 then l @ [] else appZero (x - 1) l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in ((a1 + 1), (bigAdd a2 (appZero a1 (mulByDigit x l2)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(13,11)-(24,34)
fun x ->
  fun l ->
    if x > 0
    then l @ []
    else appZero (x - 1) l
LamG (LamG EmptyG)

(30,33)-(30,73)
(a1 + 1 , bigAdd a2
                 (appZero a1 (mulByDigit x
                                         l2)))
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(30,67)-(30,69)
appZero
VarG

(30,44)-(30,66)
a1
VarG

(30,56)-(30,62)
x
VarG

(30,70)-(30,72)
l2
VarG

*)

(* changed exprs
Lam (Just (13,16)-(13,65)) (VarPat (Just (13,16)-(13,17)) "x") (Lam (Just (13,18)-(13,65)) (VarPat (Just (13,18)-(13,19)) "l") (Ite (Just (13,22)-(13,65)) (Bop (Just (13,25)-(13,30)) Gt (Var (Just (13,25)-(13,26)) "x") (Lit (Just (13,29)-(13,30)) (LI 0))) (App (Just (13,36)-(13,42)) (Var (Just (13,38)-(13,39)) "@") [Var (Just (13,36)-(13,37)) "l",List (Just (13,40)-(13,42)) [] Nothing]) (App (Just (13,48)-(13,65)) (Var (Just (13,48)-(13,55)) "appZero") [Bop (Just (13,56)-(13,63)) Minus (Var (Just (13,57)-(13,58)) "x") (Lit (Just (13,61)-(13,62)) (LI 1)),Var (Just (13,64)-(13,65)) "l"])) Nothing) Nothing
Tuple (Just (33,23)-(33,77)) [Bop (Just (33,24)-(33,32)) Plus (Var (Just (33,25)-(33,27)) "a1") (Lit (Just (33,30)-(33,31)) (LI 1)),App (Just (33,34)-(33,76)) (Var (Just (33,35)-(33,41)) "bigAdd") [Var (Just (33,42)-(33,44)) "a2",App (Just (33,45)-(33,75)) (Var (Just (33,46)-(33,53)) "appZero") [Var (Just (33,54)-(33,56)) "a1",App (Just (33,57)-(33,74)) (Var (Just (33,58)-(33,68)) "mulByDigit") [Var (Just (33,69)-(33,70)) "x",Var (Just (33,71)-(33,73)) "l2"]]]]
Var (Just (33,46)-(33,53)) "appZero"
Var (Just (33,54)-(33,56)) "a1"
Var (Just (33,69)-(33,70)) "x"
Var (Just (33,71)-(33,73)) "l2"
*)

(* typed spans
(13,16)-(13,65)
(33,23)-(33,77)
(33,46)-(33,53)
(33,54)-(33,56)
(33,69)-(33,70)
(33,71)-(33,73)
*)

(* correct types
int -> int list -> int list
(int * int list)
int -> int list -> int list
int
int
int list
*)

(* bad types
int list -> int list -> int list
(float * int list)
float -> float -> float
float
int
float
*)
