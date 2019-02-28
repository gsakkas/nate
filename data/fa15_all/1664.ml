
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
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        clone 1 (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (let (carry,ans) = a in (1, ([9] @ ans)))
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,69)-(15,70)
10
LitG

(18,8)-(18,72)
(1 , let (y , z) = x in
     [((y + z) + carry) mod 10] @ ans)
TupleG (fromList [LitG,LetG NonRec (fromList [EmptyG]) EmptyG])

(18,8)-(18,72)
1
LitG

(18,8)-(18,72)
let (y , z) = x in
[((y + z) + carry) mod 10] @ ans
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(18,8)-(18,72)
x
VarG

(18,8)-(18,72)
[((y + z) + carry) mod 10] @ ans
AppG (fromList [VarG,ListG EmptyG])

(18,8)-(18,72)
(@)
VarG

(18,8)-(18,72)
[((y + z) + carry) mod 10]
ListG (BopG EmptyG EmptyG)

(18,8)-(18,72)
((y + z) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(18,8)-(18,72)
(y + z) + carry
BopG (BopG EmptyG EmptyG) VarG

(18,8)-(18,72)
y + z
BopG VarG VarG

(18,8)-(18,72)
y
VarG

(18,8)-(18,72)
z
VarG

(18,8)-(18,72)
carry
VarG

(18,8)-(18,72)
10
LitG

(18,8)-(18,72)
ans
VarG

(18,8)-(18,72)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) = 10)
then (let (carry , ans) = a in
      (1 , [9] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
IteG (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,9)-(21,56)
let (y , z) = x in
((y + z) + carry) = 10
LetG NonRec (fromList [VarG]) (BopG EmptyG EmptyG)

(21,9)-(21,56)
let (carry , ans) = a in
(1 , [9] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(21,10)-(21,11)
1
LitG

(21,10)-(21,11)
[9] @ ans
AppG (fromList [VarG,ListG EmptyG])

(21,10)-(21,11)
let (carry , ans) = a in
(0 , let (y , z) = x in
     [(y + z) + carry] @ ans)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lit (Just (15,69)-(15,71)) (LI 10)
Tuple (Just (18,8)-(18,64)) [Lit (Just (18,9)-(18,10)) (LI 1),Let (Just (18,12)-(18,63)) NonRec [(TuplePat (Just (18,18)-(18,21)) [VarPat (Just (18,18)-(18,19)) "y",VarPat (Just (18,20)-(18,21)) "z"],Var (Just (18,25)-(18,26)) "x")] (App (Just (18,30)-(18,62)) (Var (Just (18,57)-(18,58)) "@") [List (Just (18,30)-(18,56)) [Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))] Nothing,Var (Just (18,59)-(18,62)) "ans"])]
Lit (Just (18,9)-(18,10)) (LI 1)
Let (Just (18,12)-(18,63)) NonRec [(TuplePat (Just (18,18)-(18,21)) [VarPat (Just (18,18)-(18,19)) "y",VarPat (Just (18,20)-(18,21)) "z"],Var (Just (18,25)-(18,26)) "x")] (App (Just (18,30)-(18,62)) (Var (Just (18,57)-(18,58)) "@") [List (Just (18,30)-(18,56)) [Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))] Nothing,Var (Just (18,59)-(18,62)) "ans"])
Var (Just (18,25)-(18,26)) "x"
App (Just (18,30)-(18,62)) (Var (Just (18,57)-(18,58)) "@") [List (Just (18,30)-(18,56)) [Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))] Nothing,Var (Just (18,59)-(18,62)) "ans"]
Var (Just (18,57)-(18,58)) "@"
List (Just (18,30)-(18,56)) [Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))] Nothing
Bop (Just (18,31)-(18,55)) Mod (Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")) (Lit (Just (18,53)-(18,55)) (LI 10))
Bop (Just (18,31)-(18,48)) Plus (Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")) (Var (Just (18,42)-(18,47)) "carry")
Bop (Just (18,32)-(18,39)) Plus (Var (Just (18,33)-(18,34)) "y") (Var (Just (18,37)-(18,38)) "z")
Var (Just (18,33)-(18,34)) "y"
Var (Just (18,37)-(18,38)) "z"
Var (Just (18,42)-(18,47)) "carry"
Lit (Just (18,53)-(18,55)) (LI 10)
Var (Just (18,59)-(18,62)) "ans"
Ite (Just (20,8)-(24,59)) (Let (Just (20,11)-(20,75)) NonRec [(TuplePat (Just (20,17)-(20,26)) [VarPat (Just (20,17)-(20,22)) "carry",VarPat (Just (20,23)-(20,26)) "ans"],Var (Just (20,30)-(20,31)) "a")] (Let (Just (20,35)-(20,74)) NonRec [(TuplePat (Just (20,40)-(20,43)) [VarPat (Just (20,40)-(20,41)) "y",VarPat (Just (20,42)-(20,43)) "z"],Var (Just (20,47)-(20,48)) "x")] (Bop (Just (20,52)-(20,74)) Eq (Bop (Just (20,52)-(20,69)) Plus (Bop (Just (20,53)-(20,60)) Plus (Var (Just (20,54)-(20,55)) "y") (Var (Just (20,58)-(20,59)) "z")) (Var (Just (20,63)-(20,68)) "carry")) (Lit (Just (20,72)-(20,74)) (LI 10))))) (Let (Just (21,13)-(21,54)) NonRec [(TuplePat (Just (21,19)-(21,28)) [VarPat (Just (21,19)-(21,24)) "carry",VarPat (Just (21,25)-(21,28)) "ans"],Var (Just (21,32)-(21,33)) "a")] (Tuple (Just (21,37)-(21,53)) [Lit (Just (21,38)-(21,39)) (LI 1),App (Just (21,41)-(21,52)) (Var (Just (21,46)-(21,47)) "@") [List (Just (21,42)-(21,45)) [Lit (Just (21,43)-(21,44)) (LI 9)] Nothing,Var (Just (21,48)-(21,51)) "ans"]])) (Let (Just (23,10)-(24,59)) NonRec [(TuplePat (Just (23,16)-(23,25)) [VarPat (Just (23,16)-(23,21)) "carry",VarPat (Just (23,22)-(23,25)) "ans"],Var (Just (23,29)-(23,30)) "a")] (Tuple (Just (24,11)-(24,58)) [Lit (Just (24,12)-(24,13)) (LI 0),Let (Just (24,15)-(24,57)) NonRec [(TuplePat (Just (24,21)-(24,24)) [VarPat (Just (24,21)-(24,22)) "y",VarPat (Just (24,23)-(24,24)) "z"],Var (Just (24,28)-(24,29)) "x")] (App (Just (24,33)-(24,56)) (Var (Just (24,51)-(24,52)) "@") [List (Just (24,33)-(24,50)) [Bop (Just (24,34)-(24,49)) Plus (Bop (Just (24,34)-(24,41)) Plus (Var (Just (24,35)-(24,36)) "y") (Var (Just (24,39)-(24,40)) "z")) (Var (Just (24,44)-(24,49)) "carry")] Nothing,Var (Just (24,53)-(24,56)) "ans"])]))
Let (Just (20,35)-(20,74)) NonRec [(TuplePat (Just (20,40)-(20,43)) [VarPat (Just (20,40)-(20,41)) "y",VarPat (Just (20,42)-(20,43)) "z"],Var (Just (20,47)-(20,48)) "x")] (Bop (Just (20,52)-(20,74)) Eq (Bop (Just (20,52)-(20,69)) Plus (Bop (Just (20,53)-(20,60)) Plus (Var (Just (20,54)-(20,55)) "y") (Var (Just (20,58)-(20,59)) "z")) (Var (Just (20,63)-(20,68)) "carry")) (Lit (Just (20,72)-(20,74)) (LI 10)))
Let (Just (21,13)-(21,54)) NonRec [(TuplePat (Just (21,19)-(21,28)) [VarPat (Just (21,19)-(21,24)) "carry",VarPat (Just (21,25)-(21,28)) "ans"],Var (Just (21,32)-(21,33)) "a")] (Tuple (Just (21,37)-(21,53)) [Lit (Just (21,38)-(21,39)) (LI 1),App (Just (21,41)-(21,52)) (Var (Just (21,46)-(21,47)) "@") [List (Just (21,42)-(21,45)) [Lit (Just (21,43)-(21,44)) (LI 9)] Nothing,Var (Just (21,48)-(21,51)) "ans"]])
Lit (Just (21,38)-(21,39)) (LI 1)
App (Just (21,41)-(21,52)) (Var (Just (21,46)-(21,47)) "@") [List (Just (21,42)-(21,45)) [Lit (Just (21,43)-(21,44)) (LI 9)] Nothing,Var (Just (21,48)-(21,51)) "ans"]
Let (Just (23,10)-(24,59)) NonRec [(TuplePat (Just (23,16)-(23,25)) [VarPat (Just (23,16)-(23,21)) "carry",VarPat (Just (23,22)-(23,25)) "ans"],Var (Just (23,29)-(23,30)) "a")] (Tuple (Just (24,11)-(24,58)) [Lit (Just (24,12)-(24,13)) (LI 0),Let (Just (24,15)-(24,57)) NonRec [(TuplePat (Just (24,21)-(24,24)) [VarPat (Just (24,21)-(24,22)) "y",VarPat (Just (24,23)-(24,24)) "z"],Var (Just (24,28)-(24,29)) "x")] (App (Just (24,33)-(24,56)) (Var (Just (24,51)-(24,52)) "@") [List (Just (24,33)-(24,50)) [Bop (Just (24,34)-(24,49)) Plus (Bop (Just (24,34)-(24,41)) Plus (Var (Just (24,35)-(24,36)) "y") (Var (Just (24,39)-(24,40)) "z")) (Var (Just (24,44)-(24,49)) "carry")] Nothing,Var (Just (24,53)-(24,56)) "ans"])])
*)

(* typed spans
(15,69)-(15,71)
(18,8)-(18,64)
(18,9)-(18,10)
(18,12)-(18,63)
(18,25)-(18,26)
(18,30)-(18,62)
(18,57)-(18,58)
(18,30)-(18,56)
(18,31)-(18,55)
(18,31)-(18,48)
(18,32)-(18,39)
(18,33)-(18,34)
(18,37)-(18,38)
(18,42)-(18,47)
(18,53)-(18,55)
(18,59)-(18,62)
(20,8)-(24,59)
(20,35)-(20,74)
(21,13)-(21,54)
(21,38)-(21,39)
(21,41)-(21,52)
(23,10)-(24,59)
*)

(* correct types
int
(int * int list)
int
int list
(int * int)
int list
int list -> int list -> int list
int list
int
int
int
int
int
int
int
int list
(int * int list)
bool
(int * int list)
int
int list
(int * int list)
*)

(* bad types
int
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
(int * int list)
int
int
int
*)
