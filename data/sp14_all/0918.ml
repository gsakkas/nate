
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemeneted" in
    let args = ((List.combine l1), l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,44)
a
VarG

(16,4)-(17,51)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(16,4)-(17,51)
0
LitG

(16,17)-(16,29)
[]
ListG EmptyG

(16,17)-(16,29)
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Var (Just (14,16)-(14,17)) "a"
Tuple (Just (15,15)-(15,22)) [Lit (Just (15,16)-(15,17)) (LI 0),List (Just (15,19)-(15,21)) [] Nothing]
Lit (Just (15,16)-(15,17)) (LI 0)
List (Just (15,19)-(15,21)) [] Nothing
Let (Just (16,4)-(17,51)) NonRec [(VarPat (Just (16,8)-(16,12)) "args",App (Just (16,15)-(16,33)) (Var (Just (16,15)-(16,27)) "List.combine") [Var (Just (16,28)-(16,30)) "l1",Var (Just (16,31)-(16,33)) "l2"])] (Let (Just (17,4)-(17,51)) NonRec [(TuplePat (Just (17,9)-(17,14)) [WildPat (Just (17,9)-(17,10)),VarPat (Just (17,11)-(17,14)) "res"],App (Just (17,18)-(17,44)) (Var (Just (17,18)-(17,32)) "List.fold_left") [Var (Just (17,33)-(17,34)) "f",Var (Just (17,35)-(17,39)) "base",Var (Just (17,40)-(17,44)) "args"])] (Var (Just (17,48)-(17,51)) "res"))
*)

(* typed spans
(14,16)-(14,17)
(15,15)-(15,22)
(15,16)-(15,17)
(15,19)-(15,21)
(16,4)-(17,51)
*)

(* correct types
(int * int list)
(int * int list)
int
int list
int list
*)

(* bad types
'a
int list
int list
int list -> 'a list -> (int * 'a) list
int list -> 'a list -> (int * 'a) list
*)
