
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
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
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
(22,10)-(24,64)
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

*)

(* changed exprs
Case (Just (22,10)-(24,64)) (Var (Just (22,17)-(22,18)) "a") [(ConPat (Just (23,13)-(23,15)) "[]" Nothing,Nothing,Let (Just (23,19)-(23,49)) NonRec [(VarPat (Just (23,23)-(23,26)) "sum",Bop (Just (23,29)-(23,34)) Plus (Var (Just (23,29)-(23,30)) "z") (Var (Just (23,33)-(23,34)) "y"))] (App (Just (23,38)-(23,49)) (Var (Just (23,38)-(23,45)) "intlist") [Var (Just (23,46)-(23,49)) "sum"])),(ConsPat (Just (24,13)-(24,17)) (VarPat (Just (24,13)-(24,14)) "h") (VarPat (Just (24,16)-(24,17)) "t"),Nothing,Let (Just (24,21)-(24,63)) NonRec [(VarPat (Just (24,25)-(24,28)) "sum",Bop (Just (24,31)-(24,42)) Plus (Bop (Just (24,31)-(24,38)) Plus (Var (Just (24,32)-(24,33)) "h") (Var (Just (24,36)-(24,37)) "z")) (Var (Just (24,41)-(24,42)) "y"))] (App (Just (24,46)-(24,63)) (Var (Just (24,60)-(24,61)) "@") [App (Just (24,46)-(24,59)) (Var (Just (24,47)-(24,54)) "intlist") [Var (Just (24,55)-(24,58)) "sum"],Var (Just (24,62)-(24,63)) "t"]))]
*)

(* typed spans
(22,10)-(24,64)
*)

(* correct types
int list
*)

(* bad types
int list
*)
