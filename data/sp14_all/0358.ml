
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [a; (x + y) mod 10] in
    let base = [] in
    let args = failwith List.combine (l1 l2) in
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
(14,16)-(14,59)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(16,15)-(16,44)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(16,37)-(16,44)
l1
VarG

(16,37)-(16,44)
l2
VarG

(17,4)-(17,51)
List.fold_left f base args
AppG (fromList [VarG])

(17,4)-(17,51)
List.fold_left
VarG

(17,4)-(17,51)
f
VarG

(17,4)-(17,51)
base
VarG

(17,4)-(17,51)
args
VarG

*)

(* changed exprs
Case (Just (15,6)-(20,41)) (Var (Just (15,12)-(15,13)) "x") [(TuplePat (Just (16,9)-(16,12)) [VarPat (Just (16,9)-(16,10)) "y",VarPat (Just (16,11)-(16,12)) "z"],Nothing,Let (Just (17,10)-(20,41)) NonRec [(VarPat (Just (17,14)-(17,17)) "sum",Bop (Just (17,20)-(17,25)) Plus (Var (Just (17,20)-(17,21)) "y") (Var (Just (17,24)-(17,25)) "z"))] (Case (Just (18,10)-(20,41)) (Var (Just (18,17)-(18,18)) "a") [(ConsPat (Just (19,13)-(19,17)) (VarPat (Just (19,13)-(19,14)) "h") (VarPat (Just (19,16)-(19,17)) "t"),Nothing,ConApp (Just (19,21)-(19,64)) "::" (Just (Tuple (Just (19,21)-(19,64)) [Bop (Just (19,21)-(19,37)) Div (Bop (Just (19,22)-(19,31)) Plus (Var (Just (19,23)-(19,26)) "sum") (Var (Just (19,29)-(19,30)) "h")) (Lit (Just (19,34)-(19,36)) (LI 10)),ConApp (Just (19,41)-(19,64)) "::" (Just (Tuple (Just (19,41)-(19,64)) [Bop (Just (19,41)-(19,59)) Mod (Bop (Just (19,42)-(19,51)) Plus (Var (Just (19,43)-(19,46)) "sum") (Var (Just (19,49)-(19,50)) "h")) (Lit (Just (19,56)-(19,58)) (LI 10)),Var (Just (19,63)-(19,64)) "t"])) Nothing])) Nothing),(WildPat (Just (20,13)-(20,14)),Nothing,List (Just (20,18)-(20,40)) [Bop (Just (20,19)-(20,27)) Div (Var (Just (20,19)-(20,22)) "sum") (Lit (Just (20,25)-(20,27)) (LI 10)),Bop (Just (20,29)-(20,39)) Mod (Var (Just (20,29)-(20,32)) "sum") (Lit (Just (20,37)-(20,39)) (LI 10))] Nothing)]))]
App (Just (22,15)-(22,44)) (Var (Just (22,15)-(22,23)) "List.rev") [App (Just (22,24)-(22,44)) (Var (Just (22,25)-(22,37)) "List.combine") [Var (Just (22,38)-(22,40)) "l1",Var (Just (22,41)-(22,43)) "l2"]]
Var (Just (22,38)-(22,40)) "l1"
Var (Just (22,41)-(22,43)) "l2"
App (Just (22,48)-(22,74)) (Var (Just (22,48)-(22,62)) "List.fold_left") [Var (Just (22,63)-(22,64)) "f",Var (Just (22,65)-(22,69)) "base",Var (Just (22,70)-(22,74)) "args"]
Var (Just (22,48)-(22,62)) "List.fold_left"
Var (Just (22,63)-(22,64)) "f"
Var (Just (22,65)-(22,69)) "base"
Var (Just (22,70)-(22,74)) "args"
*)

(* typed spans
(15,6)-(20,41)
(22,15)-(22,44)
(22,38)-(22,40)
(22,41)-(22,43)
(22,48)-(22,74)
(22,48)-(22,62)
(22,63)-(22,64)
(22,65)-(22,69)
(22,70)-(22,74)
*)

(* correct types
int list
(int * int) list
int list
int list
int list
(int list -> (int * int) -> int list) -> int list -> (int * int) list -> int list
int list -> (int * int) -> int list
int list
(int * int) list
*)

(* bad types
int list
'a
'a
'a
'a
'a
'a
'a
'a
*)
