
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in tens :: ones :: res in
    let base = ([0], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(23,66)
if carry <> []
then (let ch :: _ = carry in
      let tens =
        ((x1 + x2) + ch) / 10 in
      let ones =
        ((x1 + x2) + ch) mod 10 in
      ([tens] , tens :: (ones :: res)))
else (let tens =
        (x1 + x2) / 10 in
      let ones = (x1 + x2) mod 10 in
      ([tens] , tens :: (ones :: res)))
IteG (BopG EmptyG EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(24,21)-(24,23)
[]
ListG EmptyG

*)

(* changed exprs
Ite (Just (22,6)-(29,72)) (Bop (Just (22,9)-(22,20)) Neq (Var (Just (22,9)-(22,14)) "carry") (List (Just (22,18)-(22,20)) [] Nothing)) (Let (Just (24,8)-(26,77)) NonRec [(ConsPat (Just (24,12)-(24,17)) (VarPat (Just (24,12)-(24,14)) "ch") (WildPat (Just (24,16)-(24,17))),Var (Just (24,20)-(24,25)) "carry")] (Let (Just (25,8)-(26,77)) NonRec [(VarPat (Just (25,12)-(25,16)) "tens",Bop (Just (25,19)-(25,40)) Div (Bop (Just (25,19)-(25,35)) Plus (Bop (Just (25,20)-(25,29)) Plus (Var (Just (25,21)-(25,23)) "x1") (Var (Just (25,26)-(25,28)) "x2")) (Var (Just (25,32)-(25,34)) "ch")) (Lit (Just (25,38)-(25,40)) (LI 10)))] (Let (Just (26,8)-(26,77)) NonRec [(VarPat (Just (26,12)-(26,16)) "ones",Bop (Just (26,19)-(26,42)) Mod (Bop (Just (26,19)-(26,35)) Plus (Bop (Just (26,20)-(26,29)) Plus (Var (Just (26,21)-(26,23)) "x1") (Var (Just (26,26)-(26,28)) "x2")) (Var (Just (26,32)-(26,34)) "ch")) (Lit (Just (26,40)-(26,42)) (LI 10)))] (Tuple (Just (26,46)-(26,77)) [List (Just (26,47)-(26,53)) [Var (Just (26,48)-(26,52)) "tens"] Nothing,ConApp (Just (26,55)-(26,76)) "::" (Just (Tuple (Just (26,56)-(26,75)) [Var (Just (26,56)-(26,60)) "tens",ConApp (Just (26,64)-(26,75)) "::" (Just (Tuple (Just (26,64)-(26,75)) [Var (Just (26,64)-(26,68)) "ones",Var (Just (26,72)-(26,75)) "res"])) Nothing])) Nothing])))) (Let (Just (28,8)-(29,72)) NonRec [(VarPat (Just (28,13)-(28,17)) "tens",Bop (Just (28,20)-(28,34)) Div (Bop (Just (28,20)-(28,29)) Plus (Var (Just (28,21)-(28,23)) "x1") (Var (Just (28,26)-(28,28)) "x2")) (Lit (Just (28,32)-(28,34)) (LI 10)))] (Let (Just (29,9)-(29,71)) NonRec [(VarPat (Just (29,13)-(29,17)) "ones",Bop (Just (29,20)-(29,36)) Mod (Bop (Just (29,20)-(29,29)) Plus (Var (Just (29,21)-(29,23)) "x1") (Var (Just (29,26)-(29,28)) "x2")) (Lit (Just (29,34)-(29,36)) (LI 10)))] (Tuple (Just (29,40)-(29,71)) [List (Just (29,41)-(29,47)) [Var (Just (29,42)-(29,46)) "tens"] Nothing,ConApp (Just (29,49)-(29,70)) "::" (Just (Tuple (Just (29,50)-(29,69)) [Var (Just (29,50)-(29,54)) "tens",ConApp (Just (29,58)-(29,69)) "::" (Just (Tuple (Just (29,58)-(29,69)) [Var (Just (29,58)-(29,62)) "ones",Var (Just (29,66)-(29,69)) "res"])) Nothing])) Nothing])))
List (Just (30,20)-(30,22)) [] Nothing
*)

(* typed spans
(22,6)-(29,72)
(30,20)-(30,22)
*)

(* correct types
(int list * int list)
int list
*)

(* bad types
int list
'a list
*)
