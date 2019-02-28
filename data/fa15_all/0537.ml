
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
      let (c,d) = x in
      match a with
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
                 [((n + 1), (((h + c) + d) / 10));
                 (((h + c) + d) mod 10)
                 ::
                 t]) in
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

(20,6)-(35,20)
match x with
| (c , d) -> match a with
             | (n , listSum) -> match listSum with
                                | [] -> if ((n + c) + d) < 10
                                        then (0 , [n] @ [(n + c) + d])
                                        else (n + 1 , [n + 1] @ [((n + c) + d) mod 10])
                                | h :: t -> if ((n + c) + d) < 10
                                            then (0 , [0] @ ([(c + d) + h] @ t))
                                            else (n + 1 , [((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

*)

(* changed exprs
Tuple (Just (11,7)-(11,67)) [Var (Just (11,8)-(11,10)) "l1",App (Just (11,12)-(11,66)) (Var (Just (11,61)-(11,62)) "@") [App (Just (11,13)-(11,60)) (Var (Just (11,14)-(11,19)) "clone") [Lit (Just (11,20)-(11,21)) (LI 0),Bop (Just (11,22)-(11,59)) Minus (App (Just (11,23)-(11,39)) (Var (Just (11,24)-(11,35)) "List.length") [Var (Just (11,36)-(11,38)) "l1"]) (App (Just (11,42)-(11,58)) (Var (Just (11,43)-(11,54)) "List.length") [Var (Just (11,55)-(11,57)) "l2"])],Var (Just (11,63)-(11,65)) "l2"]]
Tuple (Just (12,7)-(12,67)) [App (Just (12,8)-(12,62)) (Var (Just (12,57)-(12,58)) "@") [App (Just (12,9)-(12,56)) (Var (Just (12,10)-(12,15)) "clone") [Lit (Just (12,16)-(12,17)) (LI 0),Bop (Just (12,18)-(12,55)) Minus (App (Just (12,19)-(12,35)) (Var (Just (12,20)-(12,31)) "List.length") [Var (Just (12,32)-(12,34)) "l2"]) (App (Just (12,38)-(12,54)) (Var (Just (12,39)-(12,50)) "List.length") [Var (Just (12,51)-(12,53)) "l1"])],Var (Just (12,59)-(12,61)) "l1"],Var (Just (12,64)-(12,66)) "l2"]
Var (Just (12,64)-(12,66)) "l2"
Case (Just (20,6)-(34,80)) (Var (Just (20,12)-(20,13)) "x") [(TuplePat (Just (21,9)-(21,12)) [VarPat (Just (21,9)-(21,10)) "c",VarPat (Just (21,11)-(21,12)) "d"],Nothing,Case (Just (22,10)-(34,80)) (Var (Just (22,17)-(22,18)) "a") [(TuplePat (Just (23,14)-(23,23)) [VarPat (Just (23,14)-(23,15)) "n",VarPat (Just (23,16)-(23,23)) "listSum"],Nothing,Case (Just (24,15)-(34,79)) (Var (Just (24,22)-(24,29)) "listSum") [(ConPat (Just (25,18)-(25,20)) "[]" Nothing,Nothing,Ite (Just (26,20)-(28,70)) (Bop (Just (26,23)-(26,41)) Lt (Bop (Just (26,23)-(26,36)) Plus (Bop (Just (26,24)-(26,31)) Plus (Var (Just (26,25)-(26,26)) "n") (Var (Just (26,29)-(26,30)) "c")) (Var (Just (26,34)-(26,35)) "d")) (Lit (Just (26,39)-(26,41)) (LI 10))) (Tuple (Just (27,25)-(27,51)) [Lit (Just (27,26)-(27,27)) (LI 0),App (Just (27,29)-(27,50)) (Var (Just (27,34)-(27,35)) "@") [List (Just (27,30)-(27,33)) [Var (Just (27,31)-(27,32)) "n"] Nothing,List (Just (27,36)-(27,49)) [Bop (Just (27,37)-(27,48)) Plus (Bop (Just (27,37)-(27,44)) Plus (Var (Just (27,38)-(27,39)) "n") (Var (Just (27,42)-(27,43)) "c")) (Var (Just (27,47)-(27,48)) "d")] Nothing]]) (Tuple (Just (28,25)-(28,70)) [Bop (Just (28,26)-(28,33)) Plus (Var (Just (28,27)-(28,28)) "n") (Lit (Just (28,31)-(28,32)) (LI 1)),App (Just (28,35)-(28,69)) (Var (Just (28,44)-(28,45)) "@") [List (Just (28,36)-(28,43)) [Bop (Just (28,37)-(28,42)) Plus (Var (Just (28,37)-(28,38)) "n") (Lit (Just (28,41)-(28,42)) (LI 1))] Nothing,List (Just (28,46)-(28,68)) [Bop (Just (28,47)-(28,67)) Mod (Bop (Just (28,47)-(28,60)) Plus (Bop (Just (28,48)-(28,55)) Plus (Var (Just (28,49)-(28,50)) "n") (Var (Just (28,53)-(28,54)) "c")) (Var (Just (28,58)-(28,59)) "d")) (Lit (Just (28,65)-(28,67)) (LI 10))] Nothing]])),(ConsPat (Just (29,18)-(29,22)) (VarPat (Just (29,18)-(29,19)) "h") (VarPat (Just (29,21)-(29,22)) "t"),Nothing,Ite (Just (30,20)-(34,78)) (Bop (Just (30,23)-(30,41)) Lt (Bop (Just (30,23)-(30,36)) Plus (Bop (Just (30,24)-(30,31)) Plus (Var (Just (30,25)-(30,26)) "n") (Var (Just (30,29)-(30,30)) "c")) (Var (Just (30,34)-(30,35)) "d")) (Lit (Just (30,39)-(30,41)) (LI 10))) (Tuple (Just (31,25)-(31,57)) [Lit (Just (31,26)-(31,27)) (LI 0),App (Just (31,29)-(31,56)) (Var (Just (31,34)-(31,35)) "@") [List (Just (31,30)-(31,33)) [Lit (Just (31,31)-(31,32)) (LI 0)] Nothing,App (Just (31,36)-(31,55)) (Var (Just (31,51)-(31,52)) "@") [List (Just (31,37)-(31,50)) [Bop (Just (31,38)-(31,49)) Plus (Bop (Just (31,38)-(31,45)) Plus (Var (Just (31,39)-(31,40)) "c") (Var (Just (31,43)-(31,44)) "d")) (Var (Just (31,48)-(31,49)) "h")] Nothing,Var (Just (31,53)-(31,54)) "t"]]]) (Tuple (Just (33,22)-(34,78)) [Bop (Just (33,23)-(33,30)) Plus (Var (Just (33,24)-(33,25)) "n") (Lit (Just (33,28)-(33,29)) (LI 1)),App (Just (34,24)-(34,77)) (Var (Just (34,46)-(34,47)) "@") [List (Just (34,25)-(34,45)) [Bop (Just (34,26)-(34,44)) Div (Bop (Just (34,26)-(34,39)) Plus (Bop (Just (34,27)-(34,34)) Plus (Var (Just (34,28)-(34,29)) "h") (Var (Just (34,32)-(34,33)) "c")) (Var (Just (34,37)-(34,38)) "d")) (Lit (Just (34,42)-(34,44)) (LI 10))] Nothing,App (Just (34,48)-(34,76)) (Var (Just (34,72)-(34,73)) "@") [List (Just (34,49)-(34,71)) [Bop (Just (34,50)-(34,70)) Mod (Bop (Just (34,50)-(34,63)) Plus (Bop (Just (34,51)-(34,58)) Plus (Var (Just (34,52)-(34,53)) "h") (Var (Just (34,56)-(34,57)) "c")) (Var (Just (34,61)-(34,62)) "d")) (Lit (Just (34,68)-(34,70)) (LI 10))] Nothing,Var (Just (34,74)-(34,75)) "t"]]]))])])]
*)

(* typed spans
(11,7)-(11,67)
(12,7)-(12,67)
(12,64)-(12,66)
(20,6)-(34,80)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
(int * int list)
*)

(* bad types
int list
int list
int list -> int list
(int * int list)
*)
