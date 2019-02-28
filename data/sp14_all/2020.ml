
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [(mulByDigit x l2) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


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
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(2,19)-(3,57)
fun x ->
  fun n ->
    match n > 0 with
    | false -> []
    | true -> x :: (clone x
                          (n - 1))
LamG (LamG EmptyG)

(2,19)-(3,57)
fun l1 ->
  fun l2 ->
    match List.length l1 = List.length l2 with
    | true -> (l1 , l2)
    | false -> (let lendiff =
                  List.length l1 - List.length l2 in
                match lendiff > 0 with
                | true -> (l1 , clone 0
                                      lendiff @ l2)
                | false -> (clone 0
                                  (- lendiff) @ l1 , l2))
LamG (LamG EmptyG)

(5,19)-(11,73)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun (x , y) ->
                match a with
                | [] -> (x + y) :: a
                | h :: t -> [(x + y) + (h / 10) ; h mod 10] @ t in
          let base = [] in
          let args =
            List.rev ((0 , 0) :: (List.combine l1
                                               l2)) in
          let res =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(15,4)-(17,58)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(19,28)-(19,75)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Lam (Just (2,14)-(3,67)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(3,67)) (VarPat (Just (2,16)-(2,17)) "n") (Case (Just (3,2)-(3,67)) (Bop (Just (3,8)-(3,13)) Gt (Var (Just (3,8)-(3,9)) "n") (Lit (Just (3,12)-(3,13)) (LI 0))) [(LitPat (Just (3,21)-(3,26)) (LB False),Nothing,List (Just (3,31)-(3,33)) [] Nothing),(LitPat (Just (3,36)-(3,40)) (LB True),Nothing,ConApp (Just (3,45)-(3,67)) "::" (Just (Tuple (Just (3,45)-(3,67)) [Var (Just (3,45)-(3,46)) "x",App (Just (3,50)-(3,67)) (Var (Just (3,51)-(3,56)) "clone") [Var (Just (3,57)-(3,58)) "x",Bop (Just (3,59)-(3,66)) Minus (Var (Just (3,60)-(3,61)) "n") (Lit (Just (3,64)-(3,65)) (LI 1))]])) Nothing)]) Nothing) Nothing
Lam (Just (5,12)-(12,54)) (VarPat (Just (5,12)-(5,14)) "l1") (Lam (Just (5,15)-(12,54)) (VarPat (Just (5,15)-(5,17)) "l2") (Case (Just (6,2)-(12,54)) (Bop (Just (6,8)-(6,43)) Eq (App (Just (6,8)-(6,24)) (Var (Just (6,9)-(6,20)) "List.length") [Var (Just (6,21)-(6,23)) "l1"]) (App (Just (6,27)-(6,43)) (Var (Just (6,28)-(6,39)) "List.length") [Var (Just (6,40)-(6,42)) "l2"])) [(LitPat (Just (7,4)-(7,8)) (LB True),Nothing,Tuple (Just (7,13)-(7,21)) [Var (Just (7,14)-(7,16)) "l1",Var (Just (7,18)-(7,20)) "l2"]),(LitPat (Just (8,4)-(8,9)) (LB False),Nothing,Let (Just (9,6)-(12,54)) NonRec [(VarPat (Just (9,10)-(9,17)) "lendiff",Bop (Just (9,20)-(9,55)) Minus (App (Just (9,20)-(9,36)) (Var (Just (9,21)-(9,32)) "List.length") [Var (Just (9,33)-(9,35)) "l1"]) (App (Just (9,39)-(9,55)) (Var (Just (9,40)-(9,51)) "List.length") [Var (Just (9,52)-(9,54)) "l2"]))] (Case (Just (10,6)-(12,54)) (Bop (Just (10,13)-(10,24)) Gt (Var (Just (10,13)-(10,20)) "lendiff") (Lit (Just (10,23)-(10,24)) (LI 0))) [(LitPat (Just (11,9)-(11,13)) (LB True),Nothing,Tuple (Just (11,18)-(11,48)) [Var (Just (11,19)-(11,21)) "l1",App (Just (11,23)-(11,47)) (Var (Just (11,42)-(11,43)) "@") [App (Just (11,24)-(11,41)) (Var (Just (11,25)-(11,30)) "clone") [Lit (Just (11,31)-(11,32)) (LI 0),Var (Just (11,33)-(11,40)) "lendiff"],Var (Just (11,44)-(11,46)) "l2"]]),(LitPat (Just (12,9)-(12,14)) (LB False),Nothing,Tuple (Just (12,19)-(12,53)) [App (Just (12,20)-(12,48)) (Var (Just (12,43)-(12,44)) "@") [App (Just (12,21)-(12,42)) (Var (Just (12,22)-(12,27)) "clone") [Lit (Just (12,28)-(12,29)) (LI 0),Uop (Just (12,30)-(12,41)) Neg (Var (Just (12,33)-(12,40)) "lendiff")],Var (Just (12,45)-(12,47)) "l1"],Var (Just (12,50)-(12,52)) "l2"])]))]) Nothing) Nothing
Lam (Just (17,11)-(26,34)) (VarPat (Just (17,11)-(17,13)) "l1") (Lam (Just (17,14)-(26,34)) (VarPat (Just (17,14)-(17,16)) "l2") (Let (Just (18,2)-(26,34)) NonRec [(VarPat (Just (18,6)-(18,9)) "add",Lam (Just (18,11)-(25,47)) (TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "l1",VarPat (Just (18,14)-(18,16)) "l2"]) (Let (Just (19,4)-(25,47)) NonRec [(VarPat (Just (19,8)-(19,9)) "f",Lam (Just (19,10)-(22,50)) (VarPat (Just (19,10)-(19,11)) "a") (Lam (Just (19,13)-(22,50)) (TuplePat (Just (19,13)-(19,16)) [VarPat (Just (19,13)-(19,14)) "x",VarPat (Just (19,15)-(19,16)) "y"]) (Case (Just (20,6)-(22,50)) (Var (Just (20,12)-(20,13)) "a") [(ConPat (Just (21,8)-(21,10)) "[]" Nothing,Nothing,ConApp (Just (21,14)-(21,26)) "::" (Just (Tuple (Just (21,14)-(21,26)) [Bop (Just (21,14)-(21,21)) Plus (Var (Just (21,15)-(21,16)) "x") (Var (Just (21,19)-(21,20)) "y"),Var (Just (21,25)-(21,26)) "a"])) Nothing),(ConsPat (Just (22,8)-(22,12)) (VarPat (Just (22,8)-(22,9)) "h") (VarPat (Just (22,11)-(22,12)) "t"),Nothing,App (Just (22,16)-(22,50)) (Var (Just (22,47)-(22,48)) "@") [List (Just (22,16)-(22,46)) [Bop (Just (22,17)-(22,35)) Plus (Bop (Just (22,17)-(22,24)) Plus (Var (Just (22,18)-(22,19)) "x") (Var (Just (22,22)-(22,23)) "y")) (Bop (Just (22,27)-(22,35)) Div (Var (Just (22,28)-(22,29)) "h") (Lit (Just (22,32)-(22,34)) (LI 10))),Bop (Just (22,37)-(22,45)) Mod (Var (Just (22,37)-(22,38)) "h") (Lit (Just (22,43)-(22,45)) (LI 10))] Nothing,Var (Just (22,49)-(22,50)) "t"])]) Nothing) Nothing)] (Let (Just (23,4)-(25,47)) NonRec [(VarPat (Just (23,8)-(23,12)) "base",List (Just (23,15)-(23,17)) [] Nothing)] (Let (Just (24,4)-(25,47)) NonRec [(VarPat (Just (24,8)-(24,12)) "args",App (Just (24,15)-(24,56)) (Var (Just (24,15)-(24,23)) "List.rev") [ConApp (Just (24,24)-(24,56)) "::" (Just (Tuple (Just (24,25)-(24,55)) [Tuple (Just (24,25)-(24,31)) [Lit (Just (24,26)-(24,27)) (LI 0),Lit (Just (24,29)-(24,30)) (LI 0)],App (Just (24,35)-(24,55)) (Var (Just (24,36)-(24,48)) "List.combine") [Var (Just (24,49)-(24,51)) "l1",Var (Just (24,52)-(24,54)) "l2"]])) Nothing])] (Let (Just (25,4)-(25,47)) NonRec [(VarPat (Just (25,8)-(25,11)) "res",App (Just (25,14)-(25,40)) (Var (Just (25,14)-(25,28)) "List.fold_left") [Var (Just (25,29)-(25,30)) "f",Var (Just (25,31)-(25,35)) "base",Var (Just (25,36)-(25,40)) "args"])] (Var (Just (25,44)-(25,47)) "res"))))) Nothing)] (App (Just (26,2)-(26,34)) (Var (Just (26,2)-(26,12)) "removeZero") [App (Just (26,13)-(26,34)) (Var (Just (26,14)-(26,17)) "add") [App (Just (26,18)-(26,33)) (Var (Just (26,19)-(26,26)) "padZero") [Var (Just (26,27)-(26,29)) "l1",Var (Just (26,30)-(26,32)) "l2"]]])) Nothing) Nothing
Case (Just (38,4)-(38,74)) (Var (Just (38,10)-(38,11)) "a") [(ConPat (Just (38,19)-(38,21)) "[]" Nothing,Nothing,App (Just (38,25)-(38,40)) (Var (Just (38,25)-(38,35)) "mulByDigit") [Var (Just (38,36)-(38,37)) "x",Var (Just (38,38)-(38,40)) "l2"]),(WildPat (Just (38,43)-(38,44)),Nothing,App (Just (38,48)-(38,74)) (Var (Just (38,48)-(38,54)) "bigAdd") [Var (Just (38,55)-(38,56)) "a",App (Just (38,57)-(38,74)) (Var (Just (38,58)-(38,68)) "mulByDigit") [Var (Just (38,69)-(38,70)) "x",Var (Just (38,71)-(38,73)) "l2"]])]
Let (Just (40,28)-(40,71)) NonRec [(VarPat (Just (40,32)-(40,35)) "res",App (Just (40,38)-(40,64)) (Var (Just (40,38)-(40,52)) "List.fold_left") [Var (Just (40,53)-(40,54)) "f",Var (Just (40,55)-(40,59)) "base",Var (Just (40,60)-(40,64)) "args"])] (Var (Just (40,68)-(40,71)) "res")
*)

(* typed spans
(2,14)-(3,67)
(5,12)-(12,54)
(17,11)-(26,34)
(38,4)-(38,74)
(40,28)-(40,71)
*)

(* correct types
int -> int -> int list
int list -> int list -> (int list * int list)
int list -> int list -> int list
int list
int list
*)

(* bad types
int list -> int list
int list -> int list
int -> int list -> int list
int list list
'a
*)
