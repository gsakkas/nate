
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

*)

(* changed exprs
Tuple (Just (11,7)-(11,67)) [Var (Just (11,8)-(11,10)) "l1",App (Just (11,12)-(11,66)) (Var (Just (11,61)-(11,62)) "@") [App (Just (11,13)-(11,60)) (Var (Just (11,14)-(11,19)) "clone") [Lit (Just (11,20)-(11,21)) (LI 0),Bop (Just (11,22)-(11,59)) Minus (App (Just (11,23)-(11,39)) (Var (Just (11,24)-(11,35)) "List.length") [Var (Just (11,36)-(11,38)) "l1"]) (App (Just (11,42)-(11,58)) (Var (Just (11,43)-(11,54)) "List.length") [Var (Just (11,55)-(11,57)) "l2"])],Var (Just (11,63)-(11,65)) "l2"]]
Tuple (Just (12,7)-(12,67)) [App (Just (12,8)-(12,62)) (Var (Just (12,57)-(12,58)) "@") [App (Just (12,9)-(12,56)) (Var (Just (12,10)-(12,15)) "clone") [Lit (Just (12,16)-(12,17)) (LI 0),Bop (Just (12,18)-(12,55)) Minus (App (Just (12,19)-(12,35)) (Var (Just (12,20)-(12,31)) "List.length") [Var (Just (12,32)-(12,34)) "l2"]) (App (Just (12,38)-(12,54)) (Var (Just (12,39)-(12,50)) "List.length") [Var (Just (12,51)-(12,53)) "l1"])],Var (Just (12,59)-(12,61)) "l1"],Var (Just (12,64)-(12,66)) "l2"]
Var (Just (12,64)-(12,66)) "l2"
*)

(* typed spans
(11,7)-(11,67)
(12,7)-(12,67)
(12,64)-(12,66)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
int list
int list
int list -> int list
*)
