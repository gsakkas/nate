
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
      match c with
      | [] -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
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
      match c with
      | 0 -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,6)-(30,77)
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (28,6)-(30,77)) (Var (Just (28,12)-(28,13)) "c") [(LitPat (Just (29,8)-(29,9)) (LI 0),Nothing,Tuple (Just (29,13)-(29,65)) [App (Just (29,14)-(29,37)) (Var (Just (29,18)-(29,19)) "@") [Var (Just (29,15)-(29,17)) "a1",List (Just (29,20)-(29,36)) [Bop (Just (29,21)-(29,35)) Div (Bop (Just (29,21)-(29,30)) Plus (Var (Just (29,22)-(29,24)) "x1") (Var (Just (29,27)-(29,29)) "x2")) (Lit (Just (29,33)-(29,35)) (LI 10))] Nothing],App (Just (29,39)-(29,64)) (Var (Just (29,43)-(29,44)) "@") [Var (Just (29,40)-(29,42)) "a2",List (Just (29,45)-(29,63)) [Bop (Just (29,46)-(29,62)) Mod (Bop (Just (29,46)-(29,55)) Plus (Var (Just (29,47)-(29,49)) "x1") (Var (Just (29,52)-(29,54)) "x2")) (Lit (Just (29,60)-(29,62)) (LI 10))] Nothing]]),(WildPat (Just (30,8)-(30,9)),Nothing,Tuple (Just (30,13)-(30,77)) [App (Just (30,14)-(30,43)) (Var (Just (30,18)-(30,19)) "@") [Var (Just (30,15)-(30,17)) "a1",List (Just (30,20)-(30,42)) [Bop (Just (30,21)-(30,41)) Div (Bop (Just (30,21)-(30,36)) Plus (Bop (Just (30,22)-(30,31)) Plus (Var (Just (30,23)-(30,25)) "x1") (Var (Just (30,28)-(30,30)) "x2")) (Var (Just (30,34)-(30,35)) "c")) (Lit (Just (30,39)-(30,41)) (LI 10))] Nothing],App (Just (30,45)-(30,76)) (Var (Just (30,49)-(30,50)) "@") [Var (Just (30,46)-(30,48)) "a2",List (Just (30,51)-(30,75)) [Bop (Just (30,52)-(30,74)) Mod (Bop (Just (30,52)-(30,67)) Plus (Bop (Just (30,53)-(30,62)) Plus (Var (Just (30,54)-(30,56)) "x1") (Var (Just (30,59)-(30,61)) "x2")) (Var (Just (30,65)-(30,66)) "c")) (Lit (Just (30,72)-(30,74)) (LI 10))] Nothing]])]
*)

(* typed spans
(28,6)-(30,77)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
