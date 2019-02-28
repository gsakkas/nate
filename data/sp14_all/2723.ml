
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x = if x < 10 then x else [intlist (x / 10); x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) :: t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,41)-(18,42)
[x]
ListG VarG

(18,48)-(18,76)
intlist (x / 10) @ [x mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(21,10)-(23,65)
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

*)

(* changed exprs
List (Just (19,23)-(19,26)) [Var (Just (19,24)-(19,25)) "x"] Nothing
App (Just (19,32)-(19,63)) (Var (Just (19,51)-(19,52)) "@") [App (Just (19,32)-(19,50)) (Var (Just (19,33)-(19,40)) "intlist") [Bop (Just (19,41)-(19,49)) Div (Var (Just (19,42)-(19,43)) "x") (Lit (Just (19,46)-(19,48)) (LI 10))],List (Just (19,53)-(19,63)) [Bop (Just (19,54)-(19,62)) Mod (Var (Just (19,54)-(19,55)) "x") (Lit (Just (19,60)-(19,62)) (LI 10))] Nothing]
Case (Just (22,10)-(24,64)) (Var (Just (22,17)-(22,18)) "a") [(ConPat (Just (23,13)-(23,15)) "[]" Nothing,Nothing,Let (Just (23,19)-(23,49)) NonRec [(VarPat (Just (23,23)-(23,26)) "sum",Bop (Just (23,29)-(23,34)) Plus (Var (Just (23,29)-(23,30)) "z") (Var (Just (23,33)-(23,34)) "y"))] (App (Just (23,38)-(23,49)) (Var (Just (23,38)-(23,45)) "intlist") [Var (Just (23,46)-(23,49)) "sum"])),(ConsPat (Just (24,13)-(24,17)) (VarPat (Just (24,13)-(24,14)) "h") (VarPat (Just (24,16)-(24,17)) "t"),Nothing,Let (Just (24,21)-(24,63)) NonRec [(VarPat (Just (24,25)-(24,28)) "sum",Bop (Just (24,31)-(24,42)) Plus (Bop (Just (24,31)-(24,38)) Plus (Var (Just (24,32)-(24,33)) "h") (Var (Just (24,36)-(24,37)) "z")) (Var (Just (24,41)-(24,42)) "y"))] (App (Just (24,46)-(24,63)) (Var (Just (24,60)-(24,61)) "@") [App (Just (24,46)-(24,59)) (Var (Just (24,47)-(24,54)) "intlist") [Var (Just (24,55)-(24,58)) "sum"],Var (Just (24,62)-(24,63)) "t"]))]
*)

(* typed spans
(19,23)-(19,26)
(19,32)-(19,63)
(22,10)-(24,64)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int
int list
int
*)
