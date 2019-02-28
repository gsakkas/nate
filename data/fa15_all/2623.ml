
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = [] in
    let args = List.combine (padZero l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,16)-(17,44)
let (x1 , x2) = x in
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,10)-(17,44)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(19,15)-(19,27)
List.rev
VarG

(19,29)-(19,36)
List.combine
VarG

*)

(* changed exprs
Let (Just (18,6)-(20,59)) NonRec [(TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "x1",VarPat (Just (18,14)-(18,16)) "x2"],Var (Just (18,20)-(18,21)) "x")] (Let (Just (19,6)-(20,59)) NonRec [(TuplePat (Just (19,11)-(19,16)) [VarPat (Just (19,11)-(19,13)) "a1",VarPat (Just (19,14)-(19,16)) "a2"],Var (Just (19,20)-(19,21)) "a")] (Tuple (Just (20,6)-(20,59)) [Bop (Just (20,7)-(20,23)) Div (Bop (Just (20,8)-(20,17)) Plus (Var (Just (20,9)-(20,11)) "x1") (Var (Just (20,14)-(20,16)) "x2")) (Lit (Just (20,20)-(20,22)) (LI 10)),ConApp (Just (20,25)-(20,58)) "::" (Just (Tuple (Just (20,26)-(20,57)) [Bop (Just (20,26)-(20,51)) Mod (Bop (Just (20,27)-(20,43)) Plus (Bop (Just (20,28)-(20,37)) Plus (Var (Just (20,29)-(20,31)) "a1") (Var (Just (20,34)-(20,36)) "x1")) (Var (Just (20,40)-(20,42)) "x2")) (Lit (Just (20,48)-(20,50)) (LI 10)),Var (Just (20,55)-(20,57)) "a2"])) Nothing]))
Tuple (Just (21,15)-(21,22)) [Lit (Just (21,16)-(21,17)) (LI 0),List (Just (21,19)-(21,21)) [] Nothing]
Var (Just (22,15)-(22,23)) "List.rev"
Var (Just (22,25)-(22,37)) "List.combine"
*)

(* typed spans
(18,6)-(20,59)
(21,15)-(21,22)
(22,15)-(22,23)
(22,25)-(22,37)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list -> (int * int) list
int list -> int list -> (int * int) list
*)

(* bad types
'a list
'a list -> 'b -> 'a list
'a list -> 'b list -> ('a * 'b) list
int list -> int list -> (int list * int list)
*)
