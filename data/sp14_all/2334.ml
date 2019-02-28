
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then (helper x) - (1 l (bigAdd l accum)) else accum in
  mulByDigit (helper i l accum);;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  mulByDigit i (helper i l accum);;

*)

(* changed spans
(34,19)-(34,54)
helper (x - 1) l (bigAdd l
                         accum)
AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(35,2)-(35,31)
mulByDigit i (helper i l
                     accum)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (34,19)-(34,52)) (Var (Just (34,19)-(34,25)) "helper") [Bop (Just (34,26)-(34,33)) Minus (Var (Just (34,27)-(34,28)) "x") (Lit (Just (34,31)-(34,32)) (LI 1)),Var (Just (34,34)-(34,35)) "l",App (Just (34,36)-(34,52)) (Var (Just (34,37)-(34,43)) "bigAdd") [Var (Just (34,44)-(34,45)) "l",Var (Just (34,46)-(34,51)) "accum"]]
App (Just (35,2)-(35,33)) (Var (Just (35,2)-(35,12)) "mulByDigit") [Var (Just (35,13)-(35,14)) "i",App (Just (35,15)-(35,33)) (Var (Just (35,16)-(35,22)) "helper") [Var (Just (35,23)-(35,24)) "i",Var (Just (35,25)-(35,26)) "l",Var (Just (35,27)-(35,32)) "accum"]]
*)

(* typed spans
(34,19)-(34,52)
(35,2)-(35,33)
*)

(* correct types
int list
'a
*)

(* bad types
int
'a
*)
