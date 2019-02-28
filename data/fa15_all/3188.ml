
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
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ([((x1 + x2) + a1) / 10], (a2 @ [((x1 + x2) + a1) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      ([((x1 + x2) + c) / 10; 0], (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,12)-(13,41)
fun y -> y
LamG VarG

(25,6)-(25,65)
let c :: c' = a1 in
([((x1 + x2) + c) / 10 ; 0] , a2 @ [((x1 + x2) + c) mod 10])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(25,7)-(25,30)
[((x1 + x2) + c) / 10 ; 0]
ListG LitG

(25,52)-(25,54)
c
VarG

*)

(* changed exprs
Lam (Just (5,6)-(5,11)) (VarPat (Just (5,6)-(5,7)) "y") (Var (Just (5,10)-(5,11)) "y") Nothing
Let (Just (27,6)-(28,66)) NonRec [(ConsPat (Just (27,10)-(27,15)) (VarPat (Just (27,10)-(27,11)) "c") (VarPat (Just (27,13)-(27,15)) "c'"),Var (Just (27,18)-(27,20)) "a1")] (Tuple (Just (28,6)-(28,66)) [List (Just (28,7)-(28,32)) [Bop (Just (28,8)-(28,28)) Div (Bop (Just (28,8)-(28,23)) Plus (Bop (Just (28,9)-(28,18)) Plus (Var (Just (28,10)-(28,12)) "x1") (Var (Just (28,15)-(28,17)) "x2")) (Var (Just (28,21)-(28,22)) "c")) (Lit (Just (28,26)-(28,28)) (LI 10)),Lit (Just (28,30)-(28,31)) (LI 0)] Nothing,App (Just (28,34)-(28,65)) (Var (Just (28,38)-(28,39)) "@") [Var (Just (28,35)-(28,37)) "a2",List (Just (28,40)-(28,64)) [Bop (Just (28,41)-(28,63)) Mod (Bop (Just (28,41)-(28,56)) Plus (Bop (Just (28,42)-(28,51)) Plus (Var (Just (28,43)-(28,45)) "x1") (Var (Just (28,48)-(28,50)) "x2")) (Var (Just (28,54)-(28,55)) "c")) (Lit (Just (28,61)-(28,63)) (LI 10))] Nothing]])
List (Just (28,7)-(28,32)) [Bop (Just (28,8)-(28,28)) Div (Bop (Just (28,8)-(28,23)) Plus (Bop (Just (28,9)-(28,18)) Plus (Var (Just (28,10)-(28,12)) "x1") (Var (Just (28,15)-(28,17)) "x2")) (Var (Just (28,21)-(28,22)) "c")) (Lit (Just (28,26)-(28,28)) (LI 10)),Lit (Just (28,30)-(28,31)) (LI 0)] Nothing
Var (Just (28,54)-(28,55)) "c"
*)

(* typed spans
(5,6)-(5,11)
(27,6)-(28,66)
(28,7)-(28,32)
(28,54)-(28,55)
*)

(* correct types
'a -> 'a
(int list * int list)
int list
int
*)

(* bad types
int list -> int list -> (int list * int list)
(int list * int list)
int list
int
*)
