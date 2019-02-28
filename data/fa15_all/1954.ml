
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x = match x with | [] -> [] | h::t -> bigAdd (mulByDigit h l1) a in
  let base = (0, []) in
  let args = tenEx 0 l2 in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(4,14)-(4,65)
fun n ->
  if n <= 0
  then []
  else x :: (clone x (n - 1))
LamG (IteG EmptyG EmptyG EmptyG)

(26,30)-(26,32)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
LamG (LamG EmptyG)

(40,14)-(40,74)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(41,13)-(41,20)
[]
ListG EmptyG

(41,14)-(41,15)
List.rev (helper l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(42,19)-(42,20)
helper
VarG

(42,13)-(42,23)
l1
VarG

(43,2)-(43,63)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Lam (Just (2,16)-(2,65)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,65)) (Bop (Just (2,23)-(2,29)) Le (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,28)-(2,29)) (LI 0))) (List (Just (2,35)-(2,37)) [] Nothing) (ConApp (Just (2,43)-(2,65)) "::" (Just (Tuple (Just (2,43)-(2,65)) [Var (Just (2,43)-(2,44)) "x",App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]])) Nothing)) Nothing
Lam (Just (26,15)-(27,61)) (VarPat (Just (26,15)-(26,17)) "l1") (Lam (Just (26,18)-(27,61)) (VarPat (Just (26,18)-(26,20)) "l2") (Case (Just (27,2)-(27,61)) (Var (Just (27,8)-(27,10)) "l1") [(ConPat (Just (27,18)-(27,20)) "[]" Nothing,Nothing,List (Just (27,24)-(27,26)) [] Nothing),(ConsPat (Just (27,29)-(27,33)) (VarPat (Just (27,29)-(27,30)) "h") (VarPat (Just (27,32)-(27,33)) "t"),Nothing,ConApp (Just (27,37)-(27,61)) "::" (Just (Tuple (Just (27,37)-(27,61)) [Tuple (Just (27,37)-(27,44)) [Var (Just (27,38)-(27,39)) "h",Var (Just (27,41)-(27,43)) "l2"],App (Just (27,48)-(27,61)) (Var (Just (27,49)-(27,55)) "helper") [Var (Just (27,56)-(27,57)) "t",Var (Just (27,58)-(27,60)) "l2"]])) Nothing)]) Nothing) Nothing
Let (Just (39,4)-(41,62)) NonRec [(TuplePat (Just (39,9)-(39,14)) [VarPat (Just (39,9)-(39,11)) "x1",VarPat (Just (39,12)-(39,14)) "x2"],Var (Just (39,18)-(39,19)) "x")] (Let (Just (40,4)-(41,62)) NonRec [(TuplePat (Just (40,9)-(40,18)) [VarPat (Just (40,9)-(40,14)) "carry",VarPat (Just (40,15)-(40,18)) "res"],Var (Just (40,22)-(40,23)) "a")] (Tuple (Just (41,4)-(41,62)) [App (Just (41,5)-(41,18)) (Var (Just (41,12)-(41,13)) "@") [Var (Just (41,6)-(41,11)) "carry",List (Just (41,14)-(41,17)) [Lit (Just (41,15)-(41,16)) (LI 0)] Nothing],App (Just (41,20)-(41,61)) (Var (Just (41,21)-(41,27)) "bigAdd") [App (Just (41,28)-(41,56)) (Var (Just (41,48)-(41,49)) "@") [App (Just (41,29)-(41,47)) (Var (Just (41,30)-(41,40)) "mulByDigit") [Var (Just (41,41)-(41,43)) "x1",Var (Just (41,44)-(41,46)) "x2"],Var (Just (41,50)-(41,55)) "carry"],Var (Just (41,57)-(41,60)) "res"]]))
List (Just (42,18)-(42,20)) [] Nothing
App (Just (43,13)-(43,36)) (Var (Just (43,13)-(43,21)) "List.rev") [App (Just (43,22)-(43,36)) (Var (Just (43,23)-(43,29)) "helper") [Var (Just (43,30)-(43,32)) "l1",Var (Just (43,33)-(43,35)) "l2"]]
Var (Just (43,23)-(43,29)) "helper"
Var (Just (43,30)-(43,32)) "l1"
Let (Just (44,2)-(44,49)) NonRec [(TuplePat (Just (44,7)-(44,12)) [WildPat (Just (44,7)-(44,8)),VarPat (Just (44,9)-(44,12)) "res"],App (Just (44,16)-(44,42)) (Var (Just (44,16)-(44,30)) "List.fold_left") [Var (Just (44,31)-(44,32)) "f",Var (Just (44,33)-(44,37)) "base",Var (Just (44,38)-(44,42)) "args"])] (Var (Just (44,46)-(44,49)) "res")
*)

(* typed spans
(2,16)-(2,65)
(26,15)-(27,61)
(39,4)-(41,62)
(42,18)-(42,20)
(43,13)-(43,36)
(43,23)-(43,29)
(43,30)-(43,32)
(44,2)-(44,49)
*)

(* correct types
int -> int list
int list -> int list -> (int * int list) list
(int list * int list)
int list
(int * int list) list
int list -> int list -> (int * int list) list
int list
int list
*)

(* bad types
int -> int -> int list
int list
int list
(int * 'a list)
int
int
int list
'a list
*)
