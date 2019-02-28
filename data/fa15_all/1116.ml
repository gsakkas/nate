
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
      match x with
      | h::t ->
          (match a with
           | hd::tl -> ((((fst h) + (snd h)) + hd) / 10) ::
               ((((fst h) + (snd h)) + hd) mod 10) :: tl) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


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
      match a with
      | hd::tl -> ((((fst x) + (snd x)) + hd) / 10) ::
          ((((fst x) + (snd x)) + hd) mod 10) :: tl in
    let base = [] in
    let args = List.combine l1 l2 in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(22,57)
match a with
| hd :: tl -> (((fst x + snd x) + hd) / 10) :: ((((fst x + snd x) + hd) mod 10) :: tl)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG])))]))))])

(24,15)-(24,44)
List.combine l1 l2
AppG (fromList [VarG])

(24,15)-(24,44)
List.combine
VarG

(24,15)-(24,44)
l1
VarG

(24,15)-(24,44)
l2
VarG

*)

(* changed exprs
Case (Just (18,6)-(20,51)) (Var (Just (18,12)-(18,13)) "a") [(ConsPat (Just (19,8)-(19,14)) (VarPat (Just (19,8)-(19,10)) "hd") (VarPat (Just (19,12)-(19,14)) "tl"),Nothing,ConApp (Just (19,18)-(20,51)) "::" (Just (Tuple (Just (19,18)-(20,51)) [Bop (Just (19,18)-(19,51)) Div (Bop (Just (19,19)-(19,45)) Plus (Bop (Just (19,20)-(19,39)) Plus (App (Just (19,21)-(19,28)) (Var (Just (19,22)-(19,25)) "fst") [Var (Just (19,26)-(19,27)) "x"]) (App (Just (19,31)-(19,38)) (Var (Just (19,32)-(19,35)) "snd") [Var (Just (19,36)-(19,37)) "x"])) (Var (Just (19,42)-(19,44)) "hd")) (Lit (Just (19,48)-(19,50)) (LI 10)),ConApp (Just (20,10)-(20,51)) "::" (Just (Tuple (Just (20,10)-(20,51)) [Bop (Just (20,10)-(20,45)) Mod (Bop (Just (20,11)-(20,37)) Plus (Bop (Just (20,12)-(20,31)) Plus (App (Just (20,13)-(20,20)) (Var (Just (20,14)-(20,17)) "fst") [Var (Just (20,18)-(20,19)) "x"]) (App (Just (20,23)-(20,30)) (Var (Just (20,24)-(20,27)) "snd") [Var (Just (20,28)-(20,29)) "x"])) (Var (Just (20,34)-(20,36)) "hd")) (Lit (Just (20,42)-(20,44)) (LI 10)),Var (Just (20,49)-(20,51)) "tl"])) Nothing])) Nothing)]
App (Just (22,15)-(22,33)) (Var (Just (22,15)-(22,27)) "List.combine") [Var (Just (22,28)-(22,30)) "l1",Var (Just (22,31)-(22,33)) "l2"]
Var (Just (22,15)-(22,27)) "List.combine"
Var (Just (22,28)-(22,30)) "l1"
Var (Just (22,31)-(22,33)) "l2"
*)

(* typed spans
(18,6)-(20,51)
(22,15)-(22,33)
(22,15)-(22,27)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* correct types
int list
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
int list
(int * int) list
(int * int) list
(int * int) list
(int * int) list
*)
