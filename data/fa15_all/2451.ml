
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let test = match a with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a), (bigAdd multi a)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in
    let test = match a1 with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a1), (bigAdd multi a2)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,4)-(38,75)
let (a1 , a2) = a in
let test =
  match a1 with
  | [] -> 1
  | h :: t -> 10 * h in
let multi =
  mulByDigit (test * x) l1 in
(test :: a1 , bigAdd multi a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (37,4)-(39,77)) NonRec [(TuplePat (Just (37,9)-(37,14)) [VarPat (Just (37,9)-(37,11)) "a1",VarPat (Just (37,12)-(37,14)) "a2"],Var (Just (37,18)-(37,19)) "a")] (Let (Just (38,4)-(39,77)) NonRec [(VarPat (Just (38,8)-(38,12)) "test",Case (Just (38,15)-(38,55)) (Var (Just (38,21)-(38,23)) "a1") [(ConPat (Just (38,31)-(38,33)) "[]" Nothing,Nothing,Lit (Just (38,37)-(38,38)) (LI 1)),(ConsPat (Just (38,41)-(38,45)) (VarPat (Just (38,41)-(38,42)) "h") (VarPat (Just (38,44)-(38,45)) "t"),Nothing,Bop (Just (38,49)-(38,55)) Times (Lit (Just (38,49)-(38,51)) (LI 10)) (Var (Just (38,54)-(38,55)) "h"))])] (Let (Just (39,4)-(39,77)) NonRec [(VarPat (Just (39,8)-(39,13)) "multi",App (Just (39,16)-(39,40)) (Var (Just (39,16)-(39,26)) "mulByDigit") [Bop (Just (39,27)-(39,37)) Times (Var (Just (39,28)-(39,32)) "test") (Var (Just (39,35)-(39,36)) "x"),Var (Just (39,38)-(39,40)) "l1"])] (Tuple (Just (39,44)-(39,77)) [ConApp (Just (39,45)-(39,57)) "::" (Just (Tuple (Just (39,46)-(39,56)) [Var (Just (39,46)-(39,50)) "test",Var (Just (39,54)-(39,56)) "a1"])) Nothing,App (Just (39,59)-(39,76)) (Var (Just (39,60)-(39,66)) "bigAdd") [Var (Just (39,67)-(39,72)) "multi",Var (Just (39,73)-(39,75)) "a2"]])))
*)

(* typed spans
(37,4)-(39,77)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
