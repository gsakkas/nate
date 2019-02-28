
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let l1 = List.length l1 in
  let l2 = List.length l2 in
  (((clone 0 (l2 - l1)) @ l1), ((clone 0 (l1 - l2)) @ l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

*)

(* changed spans
(6,2)-(8,58)
let ll1 = List.length l1 in
let ll2 = List.length l2 in
(clone 0
       (ll2 - ll1) @ l1 , clone 0
                                (ll1 - ll2) @ l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (6,2)-(8,62)) NonRec [(VarPat (Just (6,6)-(6,9)) "ll1",App (Just (6,12)-(6,26)) (Var (Just (6,12)-(6,23)) "List.length") [Var (Just (6,24)-(6,26)) "l1"])] (Let (Just (7,2)-(8,62)) NonRec [(VarPat (Just (7,6)-(7,9)) "ll2",App (Just (7,12)-(7,26)) (Var (Just (7,12)-(7,23)) "List.length") [Var (Just (7,24)-(7,26)) "l2"])] (Tuple (Just (8,2)-(8,62)) [App (Just (8,3)-(8,31)) (Var (Just (8,26)-(8,27)) "@") [App (Just (8,4)-(8,25)) (Var (Just (8,5)-(8,10)) "clone") [Lit (Just (8,11)-(8,12)) (LI 0),Bop (Just (8,13)-(8,24)) Minus (Var (Just (8,14)-(8,17)) "ll2") (Var (Just (8,20)-(8,23)) "ll1")],Var (Just (8,28)-(8,30)) "l1"],App (Just (8,33)-(8,61)) (Var (Just (8,56)-(8,57)) "@") [App (Just (8,34)-(8,55)) (Var (Just (8,35)-(8,40)) "clone") [Lit (Just (8,41)-(8,42)) (LI 0),Bop (Just (8,43)-(8,54)) Minus (Var (Just (8,44)-(8,47)) "ll1") (Var (Just (8,50)-(8,53)) "ll2")],Var (Just (8,58)-(8,60)) "l2"]]))
*)

(* typed spans
(6,2)-(8,62)
*)

(* correct types
(int list * int list)
*)

(* bad types
('a * 'b)
*)
