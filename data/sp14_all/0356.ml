
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,7)-(7,59)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,23)-(9,51)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])

(9,32)-(9,51)
removeZero
VarG

(11,11)-(17,34)
t
VarG

(11,11)-(17,34)
l
VarG

(13,16)-(13,44)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(14,15)-(14,43)
[]
ListG EmptyG

(16,4)-(16,51)
List.rev
VarG

(16,18)-(16,44)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [App (Just (6,8)-(6,62)) (Var (Just (6,57)-(6,58)) "@") [App (Just (6,9)-(6,56)) (Var (Just (6,10)-(6,15)) "clone") [Lit (Just (6,16)-(6,17)) (LI 0),Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])],Var (Just (6,59)-(6,61)) "l1"],Var (Just (6,64)-(6,66)) "l2"]
Tuple (Just (7,7)-(7,67)) [Var (Just (7,8)-(7,10)) "l1",App (Just (7,12)-(7,66)) (Var (Just (7,61)-(7,62)) "@") [App (Just (7,13)-(7,60)) (Var (Just (7,14)-(7,19)) "clone") [Lit (Just (7,20)-(7,21)) (LI 0),Bop (Just (7,22)-(7,59)) Minus (App (Just (7,23)-(7,39)) (Var (Just (7,24)-(7,35)) "List.length") [Var (Just (7,36)-(7,38)) "l1"]) (App (Just (7,42)-(7,58)) (Var (Just (7,43)-(7,54)) "List.length") [Var (Just (7,55)-(7,57)) "l2"])],Var (Just (7,63)-(7,65)) "l2"]]
Case (Just (10,2)-(10,69)) (Var (Just (10,8)-(10,9)) "l") [(ConPat (Just (10,17)-(10,19)) "[]" Nothing,Nothing,List (Just (10,23)-(10,25)) [] Nothing),(ConsPat (Just (10,28)-(10,32)) (VarPat (Just (10,28)-(10,29)) "h") (VarPat (Just (10,31)-(10,32)) "t"),Nothing,Ite (Just (10,36)-(10,69)) (Bop (Just (10,39)-(10,44)) Eq (Var (Just (10,39)-(10,40)) "h") (Lit (Just (10,43)-(10,44)) (LI 0))) (App (Just (10,50)-(10,62)) (Var (Just (10,50)-(10,60)) "removeZero") [Var (Just (10,61)-(10,62)) "t"]) (Var (Just (10,68)-(10,69)) "l"))]
Var (Just (10,50)-(10,60)) "removeZero"
Var (Just (10,61)-(10,62)) "t"
Var (Just (10,68)-(10,69)) "l"
Case (Just (15,6)-(20,41)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,12)) [VarPat (Just (16,9)-(16,10)) "y",VarPat (Just (16,11)-(16,12)) "z"],Nothing,Let (Just (17,10)-(20,41)) NonRec [(VarPat (Just (17,14)-(17,17)) "sum",Bop (Just (17,20)-(17,25)) Plus (Var (Just (17,20)-(17,21)) "y") (Var (Just (17,24)-(17,25)) "z"))] (Case (Just (18,10)-(20,41)) (Var (Just (18,17)-(18,18)) "a") [(ConsPat (Just (19,13)-(19,17)) (VarPat (Just (19,13)-(19,14)) "h") (VarPat (Just (19,16)-(19,17)) "t"),Nothing,ConApp (Just (19,21)-(19,64)) "::" (Just (Tuple (Just (19,21)-(19,64)) [Bop (Just (19,21)-(19,37)) Div (Bop (Just (19,22)-(19,31)) Plus (Var (Just (19,23)-(19,26)) "sum") (Var (Just (19,29)-(19,30)) "h")) (Lit (Just (19,34)-(19,36)) (LI 10)),ConApp (Just (19,41)-(19,64)) "::" (Just (Tuple (Just (19,41)-(19,64)) [Bop (Just (19,41)-(19,59)) Mod (Bop (Just (19,42)-(19,51)) Plus (Var (Just (19,43)-(19,46)) "sum") (Var (Just (19,49)-(19,50)) "h")) (Lit (Just (19,56)-(19,58)) (LI 10)),Var (Just (19,63)-(19,64)) "t"])) Nothing])) Nothing),(WildPat (Just (20,13)-(20,14)),Nothing,List (Just (20,18)-(20,40)) [Bop (Just (20,19)-(20,27)) Div (Var (Just (20,19)-(20,22)) "sum") (Lit (Just (20,25)-(20,27)) (LI 10)),Bop (Just (20,29)-(20,39)) Mod (Var (Just (20,29)-(20,32)) "sum") (Lit (Just (20,37)-(20,39)) (LI 10))] Nothing)]))]
List (Just (21,15)-(21,17)) [] Nothing
Var (Just (22,15)-(22,23)) "List.rev"
App (Just (22,24)-(22,44)) (Var (Just (22,25)-(22,37)) "List.combine") [Var (Just (22,38)-(22,40)) "l1",Var (Just (22,41)-(22,43)) "l2"]
*)

(* typed spans
(6,7)-(6,67)
(7,7)-(7,67)
(10,2)-(10,69)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(15,6)-(20,41)
(21,15)-(21,17)
(22,15)-(22,23)
(22,24)-(22,44)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
int list -> int list
int list
int list
int list
int list
(int * int) list -> (int * int) list
(int * int) list
*)

(* bad types
int list
int list
'a
string
int list -> int list -> 'a
int list -> int list -> 'a
('a * 'b)
('a * 'b)
'a
('a * 'b)
*)
