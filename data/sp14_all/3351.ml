
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> h in
      adder
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
           [helper [] (h * i)]);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(2,19)-(11,31)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
LamG (LamG EmptyG)

(2,19)-(11,31)
fun l1 ->
  fun l2 ->
    if List.length l1 < List.length l2
    then (List.append (clone 0
                             (List.length l2 - List.length l1))
                      l1 , l2)
    else (l1 , List.append (clone 0
                                  (List.length l1 - List.length l2))
                           l2)
LamG (LamG EmptyG)

(2,19)-(11,31)
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,19)-(11,31)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(8,58)-(8,59)
bigAdd h (adder t)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,8)-(11,31)
t
VarG

(11,11)-(11,30)
helper [] (h * i) @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(11,11)-(11,30)
(@)
VarG

(11,12)-(11,18)
helper [] (h * i)
AppG (fromList [BopG EmptyG EmptyG,ListG EmptyG])

*)

(* changed exprs
Lam (Just (2,14)-(2,64)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,64)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Gt (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 0))) (ConApp (Just (2,34)-(2,56)) "::" (Just (Tuple (Just (2,34)-(2,56)) [Var (Just (2,34)-(2,35)) "x",App (Just (2,39)-(2,56)) (Var (Just (2,40)-(2,45)) "clone") [Var (Just (2,46)-(2,47)) "x",Bop (Just (2,48)-(2,55)) Minus (Var (Just (2,49)-(2,50)) "n") (Lit (Just (2,53)-(2,54)) (LI 1))]])) Nothing) (List (Just (2,62)-(2,64)) [] Nothing)) Nothing) Nothing
Lam (Just (4,12)-(7,77)) (VarPat (Just (4,12)-(4,14)) "l1") (Lam (Just (4,15)-(7,77)) (VarPat (Just (4,15)-(4,17)) "l2") (Ite (Just (5,2)-(7,77)) (Bop (Just (5,5)-(5,40)) Lt (App (Just (5,5)-(5,21)) (Var (Just (5,6)-(5,17)) "List.length") [Var (Just (5,18)-(5,20)) "l1"]) (App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,36)) "List.length") [Var (Just (5,37)-(5,39)) "l2"])) (Tuple (Just (6,7)-(6,77)) [App (Just (6,8)-(6,72)) (Var (Just (6,9)-(6,20)) "List.append") [App (Just (6,21)-(6,68)) (Var (Just (6,22)-(6,27)) "clone") [Lit (Just (6,28)-(6,29)) (LI 0),Bop (Just (6,30)-(6,67)) Minus (App (Just (6,31)-(6,47)) (Var (Just (6,32)-(6,43)) "List.length") [Var (Just (6,44)-(6,46)) "l2"]) (App (Just (6,50)-(6,66)) (Var (Just (6,51)-(6,62)) "List.length") [Var (Just (6,63)-(6,65)) "l1"])],Var (Just (6,69)-(6,71)) "l1"],Var (Just (6,74)-(6,76)) "l2"]) (Tuple (Just (7,7)-(7,77)) [Var (Just (7,8)-(7,10)) "l1",App (Just (7,12)-(7,76)) (Var (Just (7,13)-(7,24)) "List.append") [App (Just (7,25)-(7,72)) (Var (Just (7,26)-(7,31)) "clone") [Lit (Just (7,32)-(7,33)) (LI 0),Bop (Just (7,34)-(7,71)) Minus (App (Just (7,35)-(7,51)) (Var (Just (7,36)-(7,47)) "List.length") [Var (Just (7,48)-(7,50)) "l1"]) (App (Just (7,54)-(7,70)) (Var (Just (7,55)-(7,66)) "List.length") [Var (Just (7,67)-(7,69)) "l2"])],Var (Just (7,73)-(7,75)) "l2"]])) Nothing) Nothing
Lam (Just (9,19)-(10,69)) (VarPat (Just (9,19)-(9,20)) "l") (Case (Just (10,2)-(10,69)) (Var (Just (10,8)-(10,9)) "l") [(ConPat (Just (10,17)-(10,19)) "[]" Nothing,Nothing,List (Just (10,23)-(10,25)) [] Nothing),(ConsPat (Just (10,28)-(10,32)) (VarPat (Just (10,28)-(10,29)) "h") (VarPat (Just (10,31)-(10,32)) "t"),Nothing,Ite (Just (10,36)-(10,69)) (Bop (Just (10,39)-(10,44)) Eq (Var (Just (10,39)-(10,40)) "h") (Lit (Just (10,43)-(10,44)) (LI 0))) (App (Just (10,50)-(10,62)) (Var (Just (10,50)-(10,60)) "removeZero") [Var (Just (10,61)-(10,62)) "t"]) (Var (Just (10,68)-(10,69)) "l"))]) Nothing
Lam (Just (12,11)-(29,34)) (VarPat (Just (12,11)-(12,13)) "l1") (Lam (Just (12,14)-(29,34)) (VarPat (Just (12,14)-(12,16)) "l2") (Let (Just (13,2)-(29,34)) NonRec [(VarPat (Just (13,6)-(13,9)) "add",Lam (Just (13,11)-(28,51)) (TuplePat (Just (13,11)-(13,16)) [VarPat (Just (13,11)-(13,13)) "l1",VarPat (Just (13,14)-(13,16)) "l2"]) (Let (Just (14,4)-(28,51)) NonRec [(VarPat (Just (14,8)-(14,9)) "f",Lam (Just (14,10)-(25,60)) (VarPat (Just (14,10)-(14,11)) "a") (Lam (Just (14,12)-(25,60)) (VarPat (Just (14,12)-(14,13)) "x") (Case (Just (15,6)-(25,60)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,14)) [VarPat (Just (16,9)-(16,11)) "v1",VarPat (Just (16,12)-(16,14)) "v2"],Nothing,Case (Just (17,10)-(25,60)) (Var (Just (17,17)-(17,18)) "a") [(TuplePat (Just (18,14)-(18,25)) [VarPat (Just (18,14)-(18,19)) "list1",VarPat (Just (18,20)-(18,25)) "list2"],Nothing,Case (Just (19,15)-(25,59)) (Var (Just (19,22)-(19,27)) "list1") [(ConPat (Just (20,18)-(20,20)) "[]" Nothing,Nothing,Tuple (Just (21,20)-(22,29)) [ConApp (Just (21,21)-(21,48)) "::" (Just (Tuple (Just (21,22)-(21,47)) [Bop (Just (21,22)-(21,38)) Div (Bop (Just (21,23)-(21,32)) Plus (Var (Just (21,24)-(21,26)) "v1") (Var (Just (21,29)-(21,31)) "v2")) (Lit (Just (21,35)-(21,37)) (LI 10)),Var (Just (21,42)-(21,47)) "list1"])) Nothing,ConApp (Just (21,50)-(22,28)) "::" (Just (Tuple (Just (21,51)-(22,27)) [Bop (Just (21,51)-(21,69)) Mod (Bop (Just (21,52)-(21,61)) Plus (Var (Just (21,53)-(21,55)) "v1") (Var (Just (21,58)-(21,60)) "v2")) (Lit (Just (21,66)-(21,68)) (LI 10)),Var (Just (22,22)-(22,27)) "list2"])) Nothing]),(ConsPat (Just (23,18)-(23,22)) (VarPat (Just (23,18)-(23,19)) "h") (VarPat (Just (23,21)-(23,22)) "t"),Nothing,Tuple (Just (24,20)-(25,58)) [ConApp (Just (24,21)-(24,54)) "::" (Just (Tuple (Just (24,22)-(24,53)) [Bop (Just (24,22)-(24,44)) Div (Bop (Just (24,23)-(24,38)) Plus (Bop (Just (24,24)-(24,33)) Plus (Var (Just (24,25)-(24,27)) "v1") (Var (Just (24,30)-(24,32)) "v2")) (Var (Just (24,36)-(24,37)) "h")) (Lit (Just (24,41)-(24,43)) (LI 10)),Var (Just (24,48)-(24,53)) "list1"])) Nothing,ConApp (Just (25,22)-(25,57)) "::" (Just (Tuple (Just (25,23)-(25,56)) [Bop (Just (25,23)-(25,47)) Mod (Bop (Just (25,24)-(25,39)) Plus (Bop (Just (25,25)-(25,34)) Plus (Var (Just (25,26)-(25,28)) "v1") (Var (Just (25,31)-(25,33)) "v2")) (Var (Just (25,37)-(25,38)) "h")) (Lit (Just (25,44)-(25,46)) (LI 10)),Var (Just (25,51)-(25,56)) "list2"])) Nothing])])])]) Nothing) Nothing)] (Let (Just (26,4)-(28,51)) NonRec [(VarPat (Just (26,8)-(26,12)) "base",Tuple (Just (26,15)-(26,23)) [List (Just (26,16)-(26,18)) [] Nothing,List (Just (26,20)-(26,22)) [] Nothing])] (Let (Just (27,4)-(28,51)) NonRec [(VarPat (Just (27,8)-(27,12)) "args",App (Just (27,15)-(27,67)) (Var (Just (27,15)-(27,26)) "List.append") [App (Just (27,27)-(27,58)) (Var (Just (27,28)-(27,36)) "List.rev") [App (Just (27,37)-(27,57)) (Var (Just (27,38)-(27,50)) "List.combine") [Var (Just (27,51)-(27,53)) "l1",Var (Just (27,54)-(27,56)) "l2"]],List (Just (27,59)-(27,67)) [Tuple (Just (27,60)-(27,66)) [Lit (Just (27,61)-(27,62)) (LI 0),Lit (Just (27,64)-(27,65)) (LI 0)]] Nothing])] (Let (Just (28,4)-(28,51)) NonRec [(TuplePat (Just (28,9)-(28,14)) [WildPat (Just (28,9)-(28,10)),VarPat (Just (28,11)-(28,14)) "res"],App (Just (28,18)-(28,44)) (Var (Just (28,18)-(28,32)) "List.fold_left") [Var (Just (28,33)-(28,34)) "f",Var (Just (28,35)-(28,39)) "base",Var (Just (28,40)-(28,44)) "args"])] (Var (Just (28,48)-(28,51)) "res"))))) Nothing)] (App (Just (29,2)-(29,34)) (Var (Just (29,2)-(29,12)) "removeZero") [App (Just (29,13)-(29,34)) (Var (Just (29,14)-(29,17)) "add") [App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,26)) "padZero") [Var (Just (29,27)-(29,29)) "l1",Var (Just (29,30)-(29,32)) "l2"]]])) Nothing) Nothing
App (Just (37,58)-(37,76)) (Var (Just (37,58)-(37,64)) "bigAdd") [Var (Just (37,65)-(37,66)) "h",App (Just (37,67)-(37,76)) (Var (Just (37,68)-(37,73)) "adder") [Var (Just (37,74)-(37,75)) "t"]]
Var (Just (37,74)-(37,75)) "t"
App (Just (39,8)-(39,34)) (Var (Just (39,29)-(39,30)) "@") [App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")],List (Just (39,31)-(39,33)) [] Nothing]
Var (Just (39,29)-(39,30)) "@"
App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")]
*)

(* typed spans
(2,14)-(2,64)
(4,12)-(7,77)
(9,19)-(10,69)
(12,11)-(29,34)
(37,58)-(37,76)
(37,74)-(37,75)
(39,8)-(39,34)
(39,29)-(39,30)
(39,9)-(39,28)
*)

(* correct types
int -> int -> int list
int list -> int list -> (int list * int list)
int list -> int list
int list -> int list -> int list
int list
int list list
int list
int list -> int list -> int list
int list
*)

(* bad types
int -> int list -> int list
int -> int list -> int list
int -> int list -> int list
int -> int list -> int list
int list
int list list
int list list
int list list
int list -> int -> int list
*)
