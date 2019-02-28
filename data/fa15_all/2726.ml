
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let x l = List.map string_of_int;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x + a in
    let base = x in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,12)-(9,43)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(18,16)-(18,21)
addHelper (a , x)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,4)-(20,74)
x
VarG

(19,4)-(20,74)
let base = [] in
let args = [] in
List.fold_left f base args
LetG NonRec (fromList [ListG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (4,19)-(13,47)) (TuplePat (Just (4,19)-(4,22)) [VarPat (Just (4,19)-(4,20)) "t",VarPat (Just (4,21)-(4,22)) "u"]) (Case (Just (5,2)-(13,47)) (App (Just (5,8)-(5,18)) (Var (Just (5,8)-(5,16)) "List.rev") [Var (Just (5,17)-(5,18)) "t"]) [(ConPat (Just (6,4)-(6,6)) "[]" Nothing,Nothing,List (Just (6,10)-(6,12)) [] Nothing),(ConsPat (Just (7,4)-(7,8)) (VarPat (Just (7,4)-(7,5)) "h") (VarPat (Just (7,7)-(7,8)) "t"),Nothing,Case (Just (8,6)-(13,47)) (App (Just (8,13)-(8,23)) (Var (Just (8,13)-(8,21)) "List.rev") [Var (Just (8,22)-(8,23)) "u"]) [(ConPat (Just (9,9)-(9,11)) "[]" Nothing,Nothing,List (Just (9,15)-(9,17)) [] Nothing),(ConsPat (Just (10,9)-(10,15)) (VarPat (Just (10,9)-(10,11)) "h'") (VarPat (Just (10,13)-(10,15)) "t'"),Nothing,Ite (Just (11,11)-(13,46)) (Bop (Just (11,14)-(11,27)) Gt (Bop (Just (11,14)-(11,22)) Plus (Var (Just (11,15)-(11,16)) "h") (Var (Just (11,19)-(11,21)) "h'")) (Lit (Just (11,25)-(11,27)) (LI 10))) (App (Just (12,16)-(12,52)) (Var (Just (12,36)-(12,37)) "@") [App (Just (12,16)-(12,35)) (Var (Just (12,17)-(12,26)) "addHelper") [Tuple (Just (12,27)-(12,34)) [Var (Just (12,28)-(12,29)) "t",Var (Just (12,31)-(12,33)) "t'"]],List (Just (12,38)-(12,52)) [Bop (Just (12,39)-(12,51)) Plus (Bop (Just (12,39)-(12,47)) Plus (Lit (Just (12,40)-(12,41)) (LI 1)) (Var (Just (12,44)-(12,46)) "h'")) (Var (Just (12,50)-(12,51)) "h")] Nothing]) (App (Just (13,16)-(13,46)) (Var (Just (13,36)-(13,37)) "@") [App (Just (13,16)-(13,35)) (Var (Just (13,17)-(13,26)) "addHelper") [Tuple (Just (13,27)-(13,34)) [Var (Just (13,28)-(13,29)) "t",Var (Just (13,31)-(13,33)) "t'"]],List (Just (13,38)-(13,46)) [Bop (Just (13,39)-(13,45)) Plus (Var (Just (13,39)-(13,41)) "h'") (Var (Just (13,44)-(13,45)) "h")] Nothing]))])]) Nothing
App (Just (27,16)-(27,32)) (Var (Just (27,16)-(27,25)) "addHelper") [Tuple (Just (27,26)-(27,32)) [Var (Just (27,27)-(27,28)) "a",Var (Just (27,30)-(27,31)) "x"]]
Var (Just (27,30)-(27,31)) "x"
Let (Just (28,4)-(28,64)) NonRec [(VarPat (Just (28,8)-(28,12)) "base",List (Just (28,15)-(28,17)) [] Nothing)] (Let (Just (28,21)-(28,64)) NonRec [(VarPat (Just (28,25)-(28,29)) "args",List (Just (28,32)-(28,34)) [] Nothing)] (App (Just (28,38)-(28,64)) (Var (Just (28,38)-(28,52)) "List.fold_left") [Var (Just (28,53)-(28,54)) "f",Var (Just (28,55)-(28,59)) "base",Var (Just (28,60)-(28,64)) "args"]))
*)

(* typed spans
(4,19)-(13,47)
(27,16)-(27,32)
(27,30)-(27,31)
(28,4)-(28,64)
*)

(* correct types
(int list * int list) -> int list
int list
int list
int list
*)

(* bad types
int list -> int list -> (int list * int list)
int
int list
int list
*)
