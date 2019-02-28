
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = x in
      let b::b' = y in let c::c' = z in ([b + c], ([b + c] @ a)) in
    let base = [] in
    let args = padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,45)-(3,68)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])])))

(25,6)-(26,64)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(27,4)-(29,51)
([] , [])
TupleG (fromList [ListG EmptyG])

(27,15)-(27,17)
[]
ListG EmptyG

(28,15)-(28,22)
List.combine
VarG

*)

(* changed exprs
ConApp (Just (3,45)-(3,67)) "::" (Just (Tuple (Just (3,45)-(3,67)) [Var (Just (3,45)-(3,46)) "x",App (Just (3,50)-(3,67)) (Var (Just (3,51)-(3,56)) "clone") [Var (Just (3,57)-(3,58)) "x",Bop (Just (3,59)-(3,66)) Minus (Var (Just (3,60)-(3,61)) "n") (Lit (Just (3,64)-(3,65)) (LI 1))]])) Nothing
Let (Just (22,16)-(22,52)) NonRec [(TuplePat (Just (22,21)-(22,26)) [VarPat (Just (22,21)-(22,23)) "x1",VarPat (Just (22,24)-(22,26)) "x2"],Var (Just (22,30)-(22,31)) "x")] (Tuple (Just (22,35)-(22,52)) [List (Just (22,36)-(22,45)) [Bop (Just (22,37)-(22,44)) Plus (Var (Just (22,37)-(22,39)) "x1") (Var (Just (22,42)-(22,44)) "x2")] Nothing,List (Just (22,47)-(22,51)) [Var (Just (22,48)-(22,50)) "x2"] Nothing])
Tuple (Just (23,15)-(23,23)) [List (Just (23,16)-(23,18)) [] Nothing,List (Just (23,20)-(23,22)) [] Nothing]
List (Just (23,20)-(23,22)) [] Nothing
Var (Just (24,15)-(24,27)) "List.combine"
*)

(* typed spans
(3,45)-(3,67)
(22,16)-(22,52)
(23,15)-(23,23)
(23,20)-(23,22)
(24,15)-(24,27)
*)

(* correct types
int list
(int list * int list)
(int list * int list)
int list
int list -> int list -> (int * int) list
*)

(* bad types
int list
(int list * int list)
int list
'a list
int list -> int list -> (int list * int list)
*)
