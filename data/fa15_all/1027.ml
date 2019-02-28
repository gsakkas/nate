
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = (List.combine (List.rev l1) (List.rev l2)) @ (0, 0) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,15)-(23,57)
[]
ListG EmptyG

(23,15)-(23,57)
let args =
  List.combine (List.rev (0 :: l1))
               (List.rev (0 :: l2)) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,15)-(23,57)
List.combine (List.rev (0 :: l1))
             (List.rev (0 :: l2))
AppG (fromList [AppG (fromList [EmptyG])])

(23,15)-(23,57)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG])))

(23,60)-(23,66)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

*)

(* changed exprs
List (Just (22,19)-(22,21)) [] Nothing
Let (Just (23,4)-(24,51)) NonRec [(VarPat (Just (23,8)-(23,12)) "args",App (Just (23,15)-(23,69)) (Var (Just (23,15)-(23,27)) "List.combine") [App (Just (23,28)-(23,48)) (Var (Just (23,29)-(23,37)) "List.rev") [ConApp (Just (23,38)-(23,47)) "::" (Just (Tuple (Just (23,39)-(23,46)) [Lit (Just (23,39)-(23,40)) (LI 0),Var (Just (23,44)-(23,46)) "l1"])) Nothing],App (Just (23,49)-(23,69)) (Var (Just (23,50)-(23,58)) "List.rev") [ConApp (Just (23,59)-(23,68)) "::" (Just (Tuple (Just (23,60)-(23,67)) [Lit (Just (23,60)-(23,61)) (LI 0),Var (Just (23,65)-(23,67)) "l2"])) Nothing]])] (Let (Just (24,4)-(24,51)) NonRec [(TuplePat (Just (24,9)-(24,14)) [WildPat (Just (24,9)-(24,10)),VarPat (Just (24,11)-(24,14)) "res"],App (Just (24,18)-(24,44)) (Var (Just (24,18)-(24,32)) "List.fold_left") [Var (Just (24,33)-(24,34)) "f",Var (Just (24,35)-(24,39)) "base",Var (Just (24,40)-(24,44)) "args"])] (Var (Just (24,48)-(24,51)) "res"))
App (Just (23,15)-(23,69)) (Var (Just (23,15)-(23,27)) "List.combine") [App (Just (23,28)-(23,48)) (Var (Just (23,29)-(23,37)) "List.rev") [ConApp (Just (23,38)-(23,47)) "::" (Just (Tuple (Just (23,39)-(23,46)) [Lit (Just (23,39)-(23,40)) (LI 0),Var (Just (23,44)-(23,46)) "l1"])) Nothing],App (Just (23,49)-(23,69)) (Var (Just (23,50)-(23,58)) "List.rev") [ConApp (Just (23,59)-(23,68)) "::" (Just (Tuple (Just (23,60)-(23,67)) [Lit (Just (23,60)-(23,61)) (LI 0),Var (Just (23,65)-(23,67)) "l2"])) Nothing]]
ConApp (Just (23,38)-(23,47)) "::" (Just (Tuple (Just (23,39)-(23,46)) [Lit (Just (23,39)-(23,40)) (LI 0),Var (Just (23,44)-(23,46)) "l1"])) Nothing
ConApp (Just (23,59)-(23,68)) "::" (Just (Tuple (Just (23,60)-(23,67)) [Lit (Just (23,60)-(23,61)) (LI 0),Var (Just (23,65)-(23,67)) "l2"])) Nothing
*)

(* typed spans
(22,19)-(22,21)
(23,4)-(24,51)
(23,15)-(23,69)
(23,38)-(23,47)
(23,59)-(23,68)
*)

(* correct types
int list
int list
(int * int) list
int list
int list
*)

(* bad types
(int * int) list
(int * int) list
(int * int) list
(int * int) list
(int * int)
*)
