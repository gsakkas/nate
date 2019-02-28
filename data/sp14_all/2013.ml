
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a + x) / 10 in
    let base = 0 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,12)-(19,28)
fun (x , y) ->
  ((x + y) / 10) :: a
LamG (ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))))

(20,15)-(20,16)
[]
ListG EmptyG

(21,15)-(21,17)
List.combine l1 l2
AppG (fromList [VarG])

(21,21)-(21,68)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Lam (Just (19,13)-(19,39)) (TuplePat (Just (19,13)-(19,16)) [VarPat (Just (19,13)-(19,14)) "x",VarPat (Just (19,15)-(19,16)) "y"]) (ConApp (Just (19,20)-(19,39)) "::" (Just (Tuple (Just (19,20)-(19,39)) [Bop (Just (19,20)-(19,34)) Div (Bop (Just (19,21)-(19,28)) Plus (Var (Just (19,22)-(19,23)) "x") (Var (Just (19,26)-(19,27)) "y")) (Lit (Just (19,31)-(19,33)) (LI 10)),Var (Just (19,38)-(19,39)) "a"])) Nothing) Nothing
List (Just (20,15)-(20,17)) [] Nothing
App (Just (21,15)-(21,33)) (Var (Just (21,15)-(21,27)) "List.combine") [Var (Just (21,28)-(21,30)) "l1",Var (Just (21,31)-(21,33)) "l2"]
Let (Just (22,4)-(22,47)) NonRec [(VarPat (Just (22,8)-(22,11)) "res",App (Just (22,14)-(22,40)) (Var (Just (22,14)-(22,28)) "List.fold_left") [Var (Just (22,29)-(22,30)) "f",Var (Just (22,31)-(22,35)) "base",Var (Just (22,36)-(22,40)) "args"])] (Var (Just (22,44)-(22,47)) "res")
*)

(* typed spans
(19,13)-(19,39)
(20,15)-(20,17)
(21,15)-(21,33)
(22,4)-(22,47)
*)

(* correct types
(int * int) -> int list
int list
(int * int) list
int list
*)

(* bad types
int -> int
int
int list
int list
*)
