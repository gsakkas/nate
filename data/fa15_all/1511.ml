
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2)) l2)));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

*)

(* changed spans
(10,11)-(10,75)
List.append (clone 0
                   (List.length l1 - List.length l2))
            l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (10,11)-(10,75)) (Var (Just (10,12)-(10,23)) "List.append") [App (Just (10,24)-(10,71)) (Var (Just (10,25)-(10,30)) "clone") [Lit (Just (10,31)-(10,32)) (LI 0),Bop (Just (10,33)-(10,70)) Minus (App (Just (10,34)-(10,50)) (Var (Just (10,35)-(10,46)) "List.length") [Var (Just (10,47)-(10,49)) "l1"]) (App (Just (10,53)-(10,69)) (Var (Just (10,54)-(10,65)) "List.length") [Var (Just (10,66)-(10,68)) "l2"])],Var (Just (10,72)-(10,74)) "l2"]
*)

(* typed spans
(10,11)-(10,75)
*)

(* correct types
int list
*)

(* bad types
'a list -> 'a list
*)
