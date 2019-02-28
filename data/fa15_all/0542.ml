
let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l2
  else (clone 0 ((List.length l2) - (List.length l1))) @ l1;;

let rec removeZero l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (c,d) ->
          (match a with
           | (n,listSum) ->
               (match listSum with
                | [] ->
                    if ((n + c) + d) < 10
                    then (0, [n; (n + c) + d])
                    else ((n + 1), [n + 1; ((n + c) + d) mod 10])
                | h::t ->
                    if ((n + c) + d) < 10
                    then (0, ([0; (c + d) + h] @ t))
                    else
                      ((n + 1),
                        ([((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (c,d) ->
          (match a with
           | (n,listSum) ->
               (match listSum with
                | [] ->
                    if ((n + c) + d) < 10
                    then (0, ([n] @ [(n + c) + d]))
                    else ((n + 1), ([n + 1] @ [((n + c) + d) mod 10]))
                | h::t ->
                    if ((n + c) + d) < 10
                    then (0, ([0] @ ([(c + d) + h] @ t)))
                    else
                      ((n + 1),
                        ([((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(11,7)-(11,59)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,7)-(12,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,19)-(15,77)
l2
VarG

(27,29)-(27,45)
[n] @ [(n + c) + d]
AppG (fromList [ListG EmptyG])

(28,35)-(28,64)
[n + 1] @ [((n + c) + d) mod 10]
AppG (fromList [ListG EmptyG])

(31,30)-(31,46)
[0]
ListG LitG

(31,34)-(31,45)
[(c + d) + h] @ t
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
Tuple (Just (11,7)-(11,67)) [Var (Just (11,8)-(11,10)) "l1",App (Just (11,12)-(11,66)) (Var (Just (11,61)-(11,62)) "@") [App (Just (11,13)-(11,60)) (Var (Just (11,14)-(11,19)) "clone") [Lit (Just (11,20)-(11,21)) (LI 0),Bop (Just (11,22)-(11,59)) Minus (App (Just (11,23)-(11,39)) (Var (Just (11,24)-(11,35)) "List.length") [Var (Just (11,36)-(11,38)) "l1"]) (App (Just (11,42)-(11,58)) (Var (Just (11,43)-(11,54)) "List.length") [Var (Just (11,55)-(11,57)) "l2"])],Var (Just (11,63)-(11,65)) "l2"]]
Tuple (Just (12,7)-(12,67)) [App (Just (12,8)-(12,62)) (Var (Just (12,57)-(12,58)) "@") [App (Just (12,9)-(12,56)) (Var (Just (12,10)-(12,15)) "clone") [Lit (Just (12,16)-(12,17)) (LI 0),Bop (Just (12,18)-(12,55)) Minus (App (Just (12,19)-(12,35)) (Var (Just (12,20)-(12,31)) "List.length") [Var (Just (12,32)-(12,34)) "l2"]) (App (Just (12,38)-(12,54)) (Var (Just (12,39)-(12,50)) "List.length") [Var (Just (12,51)-(12,53)) "l1"])],Var (Just (12,59)-(12,61)) "l1"],Var (Just (12,64)-(12,66)) "l2"]
Var (Just (12,64)-(12,66)) "l2"
App (Just (27,29)-(27,50)) (Var (Just (27,34)-(27,35)) "@") [List (Just (27,30)-(27,33)) [Var (Just (27,31)-(27,32)) "n"] Nothing,List (Just (27,36)-(27,49)) [Bop (Just (27,37)-(27,48)) Plus (Bop (Just (27,37)-(27,44)) Plus (Var (Just (27,38)-(27,39)) "n") (Var (Just (27,42)-(27,43)) "c")) (Var (Just (27,47)-(27,48)) "d")] Nothing]
App (Just (28,35)-(28,69)) (Var (Just (28,44)-(28,45)) "@") [List (Just (28,36)-(28,43)) [Bop (Just (28,37)-(28,42)) Plus (Var (Just (28,37)-(28,38)) "n") (Lit (Just (28,41)-(28,42)) (LI 1))] Nothing,List (Just (28,46)-(28,68)) [Bop (Just (28,47)-(28,67)) Mod (Bop (Just (28,47)-(28,60)) Plus (Bop (Just (28,48)-(28,55)) Plus (Var (Just (28,49)-(28,50)) "n") (Var (Just (28,53)-(28,54)) "c")) (Var (Just (28,58)-(28,59)) "d")) (Lit (Just (28,65)-(28,67)) (LI 10))] Nothing]
List (Just (31,30)-(31,33)) [Lit (Just (31,31)-(31,32)) (LI 0)] Nothing
App (Just (31,36)-(31,55)) (Var (Just (31,51)-(31,52)) "@") [List (Just (31,37)-(31,50)) [Bop (Just (31,38)-(31,49)) Plus (Bop (Just (31,38)-(31,45)) Plus (Var (Just (31,39)-(31,40)) "c") (Var (Just (31,43)-(31,44)) "d")) (Var (Just (31,48)-(31,49)) "h")] Nothing,Var (Just (31,53)-(31,54)) "t"]
*)

(* typed spans
(11,7)-(11,67)
(12,7)-(12,67)
(12,64)-(12,66)
(27,29)-(27,50)
(28,35)-(28,69)
(31,30)-(31,33)
(31,36)-(31,55)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
int list
int list
int list
int list
*)

(* bad types
int list
int list
int list -> int list
int list
int list
int list
int
*)
