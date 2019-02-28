
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x = let value = mulByDigit l1 x in (0, (bigAdd value x)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x = let value = mulByDigit x l1 in (0, (bigAdd value (snd a))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(30,40)-(30,41)
l1
VarG

(30,63)-(30,64)
snd a
AppG (fromList [VarG])

(31,14)-(31,16)
0
LitG

*)

(* changed exprs
Var (Just (30,39)-(30,41)) "l1"
App (Just (30,63)-(30,70)) (Var (Just (30,64)-(30,67)) "snd") [Var (Just (30,68)-(30,69)) "a"]
Lit (Just (31,14)-(31,15)) (LI 0)
*)

(* typed spans
(30,39)-(30,41)
(30,63)-(30,70)
(31,14)-(31,15)
*)

(* correct types
int list
int list
int
*)

(* bad types
int list
int list
'a list
*)
