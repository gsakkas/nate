
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,21)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,15)-(16,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(17,4)-(17,68)
[]
ListG EmptyG

(17,4)-(17,68)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (16,6)-(21,61)) NonRec [(VarPat (Just (16,10)-(16,15)) "carry",Case (Just (16,18)-(16,43)) (Var (Just (16,24)-(16,25)) "a") [(TuplePat (Just (16,34)-(16,37)) [VarPat (Just (16,34)-(16,35)) "x",VarPat (Just (16,36)-(16,37)) "y"],Nothing,Var (Just (16,42)-(16,43)) "x")])] (Case (Just (17,6)-(21,61)) (Var (Just (17,12)-(17,13)) "x") [(TuplePat (Just (18,9)-(18,18)) [VarPat (Just (18,9)-(18,13)) "add1",VarPat (Just (18,14)-(18,18)) "add2"],Nothing,Let (Just (19,10)-(21,61)) NonRec [(VarPat (Just (19,14)-(19,23)) "new_carry",Bop (Just (19,26)-(19,54)) Div (Bop (Just (19,26)-(19,49)) Plus (Bop (Just (19,27)-(19,41)) Plus (Var (Just (19,28)-(19,33)) "carry") (Var (Just (19,36)-(19,40)) "add1")) (Var (Just (19,44)-(19,48)) "add2")) (Lit (Just (19,52)-(19,54)) (LI 10)))] (Let (Just (20,10)-(21,61)) NonRec [(VarPat (Just (20,14)-(20,19)) "digit",Bop (Just (20,22)-(20,52)) Mod (Bop (Just (20,22)-(20,45)) Plus (Bop (Just (20,23)-(20,37)) Plus (Var (Just (20,24)-(20,29)) "carry") (Var (Just (20,32)-(20,36)) "add1")) (Var (Just (20,40)-(20,44)) "add2")) (Lit (Just (20,50)-(20,52)) (LI 10)))] (Case (Just (21,10)-(21,61)) (Var (Just (21,17)-(21,18)) "a") [(TuplePat (Just (21,27)-(21,30)) [VarPat (Just (21,27)-(21,28)) "x",VarPat (Just (21,29)-(21,30)) "y"],Nothing,Tuple (Just (21,35)-(21,60)) [Var (Just (21,36)-(21,45)) "new_carry",ConApp (Just (21,47)-(21,59)) "::" (Just (Tuple (Just (21,48)-(21,58)) [Var (Just (21,48)-(21,53)) "digit",Var (Just (21,57)-(21,58)) "y"])) Nothing])])))])
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
List (Just (22,19)-(22,21)) [] Nothing
Let (Just (23,4)-(24,51)) NonRec [(VarPat (Just (23,8)-(23,12)) "args",App (Just (23,15)-(23,44)) (Var (Just (23,15)-(23,23)) "List.rev") [App (Just (23,24)-(23,44)) (Var (Just (23,25)-(23,37)) "List.combine") [Var (Just (23,38)-(23,40)) "l1",Var (Just (23,41)-(23,43)) "l2"]])] (Let (Just (24,4)-(24,51)) NonRec [(TuplePat (Just (24,9)-(24,14)) [WildPat (Just (24,9)-(24,10)),VarPat (Just (24,11)-(24,14)) "res"],App (Just (24,18)-(24,44)) (Var (Just (24,18)-(24,32)) "List.fold_left") [Var (Just (24,33)-(24,34)) "f",Var (Just (24,35)-(24,39)) "base",Var (Just (24,40)-(24,44)) "args"])] (Var (Just (24,48)-(24,51)) "res"))
*)

(* typed spans
(16,6)-(21,61)
(22,15)-(22,22)
(22,19)-(22,21)
(23,4)-(24,51)
*)

(* correct types
(int * int list)
(int * int list)
int list
int list
*)

(* bad types
int
int
int list
int list
*)
