
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let carryFunc p = let z = List.rev p in match z with | h::t -> List.rev t;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) [s]))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev ((List.combine l2 l2) @ [((0, 0), (0, 0), (0, 0))]) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let carryFunc p = let z = List.rev p in match z with | h::t -> List.rev t;;

let rec helper n x = if n > 0 then helper (n - 1) (x / 10) else [];;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) [s]))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (x,res) = List.fold_left f base args in
  res @ (helper ((List.length l2) * 2) x);;

*)

(* changed spans
(38,17)-(38,76)
fun n ->
  fun x ->
    if n > 0
    then helper (n - 1) (x / 10)
    else []
LamG (LamG EmptyG)

(55,23)-(55,43)
List.combine
VarG

(55,23)-(55,43)
l2
VarG

(55,23)-(55,43)
l2
VarG

(56,2)-(56,49)
let (x , res) =
  List.fold_left f base args in
res @ helper (List.length l2 * 2)
             x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (38,15)-(38,66)) (VarPat (Just (38,15)-(38,16)) "n") (Lam (Just (38,17)-(38,66)) (VarPat (Just (38,17)-(38,18)) "x") (Ite (Just (38,21)-(38,66)) (Bop (Just (38,24)-(38,29)) Gt (Var (Just (38,24)-(38,25)) "n") (Lit (Just (38,28)-(38,29)) (LI 0))) (App (Just (38,35)-(38,58)) (Var (Just (38,35)-(38,41)) "helper") [Bop (Just (38,42)-(38,49)) Minus (Var (Just (38,43)-(38,44)) "n") (Lit (Just (38,47)-(38,48)) (LI 1)),Bop (Just (38,50)-(38,58)) Div (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))]) (List (Just (38,64)-(38,66)) [] Nothing)) Nothing) Nothing
Var (Just (57,23)-(57,35)) "List.combine"
Var (Just (57,36)-(57,38)) "l2"
Var (Just (57,39)-(57,41)) "l2"
Let (Just (58,2)-(59,41)) NonRec [(TuplePat (Just (58,7)-(58,12)) [VarPat (Just (58,7)-(58,8)) "x",VarPat (Just (58,9)-(58,12)) "res"],App (Just (58,16)-(58,42)) (Var (Just (58,16)-(58,30)) "List.fold_left") [Var (Just (58,31)-(58,32)) "f",Var (Just (58,33)-(58,37)) "base",Var (Just (58,38)-(58,42)) "args"])] (App (Just (59,2)-(59,41)) (Var (Just (59,6)-(59,7)) "@") [Var (Just (59,2)-(59,5)) "res",App (Just (59,8)-(59,41)) (Var (Just (59,9)-(59,15)) "helper") [Bop (Just (59,16)-(59,38)) Times (App (Just (59,17)-(59,33)) (Var (Just (59,18)-(59,29)) "List.length") [Var (Just (59,30)-(59,32)) "l2"]) (Lit (Just (59,36)-(59,37)) (LI 2)),Var (Just (59,39)-(59,40)) "x"]])
*)

(* typed spans
(38,15)-(38,66)
(57,23)-(57,35)
(57,36)-(57,38)
(57,39)-(57,41)
(58,2)-(59,41)
*)

(* correct types
int -> int -> int list
int list -> int list -> (int * int) list
int list
int list
int list
*)

(* bad types
int list -> int
('a * 'a) list
('a * 'a) list
('a * 'a) list
int list
*)
