
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = ((fst x) + (snd x)) + (fst a) in (sum / 10) :: (sum mod 10) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(16,75)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,4)-(19,51)
List.fold_left f base args
AppG (fromList [VarG])

(19,4)-(19,51)
List.fold_left
VarG

(19,4)-(19,51)
f
VarG

(19,4)-(19,51)
base
VarG

(19,4)-(19,51)
args
VarG

*)

(* changed exprs
Let (Just (16,6)-(19,31)) NonRec [(VarPat (Just (16,10)-(16,11)) "b",Bop (Just (16,14)-(16,31)) Plus (App (Just (16,14)-(16,21)) (Var (Just (16,15)-(16,18)) "fst") [Var (Just (16,19)-(16,20)) "x"]) (App (Just (16,24)-(16,31)) (Var (Just (16,25)-(16,28)) "snd") [Var (Just (16,29)-(16,30)) "x"]))] (Case (Just (17,6)-(19,31)) (Var (Just (17,12)-(17,13)) "a") [(ConsPat (Just (18,8)-(18,12)) (VarPat (Just (18,8)-(18,9)) "h") (VarPat (Just (18,11)-(18,12)) "t"),Nothing,ConApp (Just (18,16)-(18,55)) "::" (Just (Tuple (Just (18,16)-(18,55)) [Bop (Just (18,16)-(18,30)) Div (Bop (Just (18,17)-(18,24)) Plus (Var (Just (18,18)-(18,19)) "h") (Var (Just (18,22)-(18,23)) "b")) (Lit (Just (18,27)-(18,29)) (LI 10)),ConApp (Just (18,34)-(18,55)) "::" (Just (Tuple (Just (18,34)-(18,55)) [Bop (Just (18,34)-(18,50)) Mod (Bop (Just (18,35)-(18,42)) Plus (Var (Just (18,36)-(18,37)) "h") (Var (Just (18,40)-(18,41)) "b")) (Lit (Just (18,47)-(18,49)) (LI 10)),Var (Just (18,54)-(18,55)) "t"])) Nothing])) Nothing),(WildPat (Just (19,8)-(19,9)),Nothing,List (Just (19,13)-(19,31)) [Bop (Just (19,14)-(19,20)) Div (Var (Just (19,14)-(19,15)) "b") (Lit (Just (19,18)-(19,20)) (LI 10)),Bop (Just (19,22)-(19,30)) Mod (Var (Just (19,22)-(19,23)) "b") (Lit (Just (19,28)-(19,30)) (LI 10))] Nothing)])
App (Just (21,48)-(21,74)) (Var (Just (21,48)-(21,62)) "List.fold_left") [Var (Just (21,63)-(21,64)) "f",Var (Just (21,65)-(21,69)) "base",Var (Just (21,70)-(21,74)) "args"]
Var (Just (21,48)-(21,62)) "List.fold_left"
Var (Just (21,63)-(21,64)) "f"
Var (Just (21,65)-(21,69)) "base"
Var (Just (21,70)-(21,74)) "args"
*)

(* typed spans
(16,6)-(19,31)
(21,48)-(21,74)
(21,48)-(21,62)
(21,63)-(21,64)
(21,65)-(21,69)
(21,70)-(21,74)
*)

(* correct types
int list
int list
(int list -> (int * int) -> int list) -> int list -> (int * int) list -> int list
int list -> (int * int) -> int list
int list
(int * int) list
*)

(* bad types
int list
int list
int list
int list
int list
int list
*)
