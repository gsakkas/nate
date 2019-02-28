
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> (0, (x1 + x2)) :: a
           | (x1,x2) when (x1 + x2) > 9 -> (1, ((x1 + x2) - 9)) :: a)
      | (z,y)::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + z) <= 9 -> (0, ((x1 + x2) + z)) :: a
           | (x1,x2) when ((x1 + x2) + z) > 9 -> (1, (((x1 + x2) + z) - 9))
               :: a) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(29,20)
let sum = fst x + snd x in
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(32,4)-(32,51)
List.rev l2
AppG (fromList [VarG])

(32,4)-(32,51)
List.rev
VarG

(32,4)-(32,51)
l2
VarG

(32,4)-(32,51)
List.fold_left f base args
AppG (fromList [VarG])

(32,4)-(32,51)
List.fold_left
VarG

*)

(* changed exprs
Let (Just (20,6)-(23,53)) NonRec [(VarPat (Just (20,10)-(20,13)) "sum",Bop (Just (20,16)-(20,33)) Plus (App (Just (20,16)-(20,23)) (Var (Just (20,17)-(20,20)) "fst") [Var (Just (20,21)-(20,22)) "x"]) (App (Just (20,26)-(20,33)) (Var (Just (20,27)-(20,30)) "snd") [Var (Just (20,31)-(20,32)) "x"]))] (Case (Just (21,6)-(23,53)) (Var (Just (21,12)-(21,13)) "a") [(ConPat (Just (22,8)-(22,10)) "[]" Nothing,Nothing,ConApp (Just (22,14)-(22,45)) "::" (Just (Tuple (Just (22,14)-(22,45)) [Bop (Just (22,14)-(22,24)) Div (Var (Just (22,15)-(22,18)) "sum") (Lit (Just (22,21)-(22,23)) (LI 10)),ConApp (Just (22,28)-(22,45)) "::" (Just (Tuple (Just (22,28)-(22,45)) [Bop (Just (22,28)-(22,40)) Mod (Var (Just (22,29)-(22,32)) "sum") (Lit (Just (22,37)-(22,39)) (LI 10)),Var (Just (22,44)-(22,45)) "a"])) Nothing])) Nothing),(ConsPat (Just (23,8)-(23,12)) (VarPat (Just (23,8)-(23,9)) "h") (VarPat (Just (23,11)-(23,12)) "t"),Nothing,ConApp (Just (23,16)-(23,53)) "::" (Just (Tuple (Just (23,16)-(23,53)) [Bop (Just (23,16)-(23,26)) Div (Var (Just (23,17)-(23,20)) "sum") (Lit (Just (23,23)-(23,25)) (LI 10)),ConApp (Just (23,30)-(23,53)) "::" (Just (Tuple (Just (23,30)-(23,53)) [Bop (Just (23,30)-(23,48)) Plus (Var (Just (23,31)-(23,32)) "h") (Bop (Just (23,35)-(23,47)) Mod (Var (Just (23,36)-(23,39)) "sum") (Lit (Just (23,44)-(23,46)) (LI 10))),Var (Just (23,52)-(23,53)) "t"])) Nothing])) Nothing)])
App (Just (25,42)-(25,55)) (Var (Just (25,43)-(25,51)) "List.rev") [Var (Just (25,52)-(25,54)) "l2"]
Var (Just (25,43)-(25,51)) "List.rev"
Var (Just (25,52)-(25,54)) "l2"
App (Just (26,4)-(26,30)) (Var (Just (26,4)-(26,18)) "List.fold_left") [Var (Just (26,19)-(26,20)) "f",Var (Just (26,21)-(26,25)) "base",Var (Just (26,26)-(26,30)) "args"]
Var (Just (26,4)-(26,18)) "List.fold_left"
*)

(* typed spans
(20,6)-(23,53)
(25,42)-(25,55)
(25,43)-(25,51)
(25,52)-(25,54)
(26,4)-(26,30)
(26,4)-(26,18)
*)

(* correct types
int list
int list
int list -> int list
int list
int list
(int list -> (int * int) -> int list) -> int list -> (int * int) list -> int list
*)

(* bad types
(int * int) list
int list
int list
int list
int list
int list
*)
