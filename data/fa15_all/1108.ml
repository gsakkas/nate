
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          (match h with
           | (b,c) ->
               (match x with
                | (first,second) -> (((first + second) + b) / 10) ::
                    (((first + second) + b) mod 10) :: t)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
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
(18,6)-(24,58)
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(27,4)-(27,51)
List.fold_left f base args
AppG (fromList [VarG])

(27,4)-(27,51)
List.fold_left
VarG

(27,4)-(27,51)
f
VarG

(27,4)-(27,51)
base
VarG

(27,4)-(27,51)
args
VarG

*)

(* changed exprs
Let (Just (18,6)-(21,31)) NonRec [(VarPat (Just (18,10)-(18,11)) "b",Bop (Just (18,14)-(18,31)) Plus (App (Just (18,14)-(18,21)) (Var (Just (18,15)-(18,18)) "fst") [Var (Just (18,19)-(18,20)) "x"]) (App (Just (18,24)-(18,31)) (Var (Just (18,25)-(18,28)) "snd") [Var (Just (18,29)-(18,30)) "x"]))] (Case (Just (19,6)-(21,31)) (Var (Just (19,12)-(19,13)) "a") [(ConsPat (Just (20,8)-(20,12)) (VarPat (Just (20,8)-(20,9)) "h") (VarPat (Just (20,11)-(20,12)) "t"),Nothing,ConApp (Just (20,16)-(20,55)) "::" (Just (Tuple (Just (20,16)-(20,55)) [Bop (Just (20,16)-(20,30)) Div (Bop (Just (20,17)-(20,24)) Plus (Var (Just (20,18)-(20,19)) "h") (Var (Just (20,22)-(20,23)) "b")) (Lit (Just (20,27)-(20,29)) (LI 10)),ConApp (Just (20,34)-(20,55)) "::" (Just (Tuple (Just (20,34)-(20,55)) [Bop (Just (20,34)-(20,50)) Mod (Bop (Just (20,35)-(20,42)) Plus (Var (Just (20,36)-(20,37)) "h") (Var (Just (20,40)-(20,41)) "b")) (Lit (Just (20,47)-(20,49)) (LI 10)),Var (Just (20,54)-(20,55)) "t"])) Nothing])) Nothing),(WildPat (Just (21,8)-(21,9)),Nothing,List (Just (21,13)-(21,31)) [Bop (Just (21,14)-(21,20)) Div (Var (Just (21,14)-(21,15)) "b") (Lit (Just (21,18)-(21,20)) (LI 10)),Bop (Just (21,22)-(21,30)) Mod (Var (Just (21,22)-(21,23)) "b") (Lit (Just (21,28)-(21,30)) (LI 10))] Nothing)])
App (Just (23,48)-(23,74)) (Var (Just (23,48)-(23,62)) "List.fold_left") [Var (Just (23,63)-(23,64)) "f",Var (Just (23,65)-(23,69)) "base",Var (Just (23,70)-(23,74)) "args"]
Var (Just (23,48)-(23,62)) "List.fold_left"
Var (Just (23,63)-(23,64)) "f"
Var (Just (23,65)-(23,69)) "base"
Var (Just (23,70)-(23,74)) "args"
*)

(* typed spans
(18,6)-(21,31)
(23,48)-(23,74)
(23,48)-(23,62)
(23,63)-(23,64)
(23,65)-(23,69)
(23,70)-(23,74)
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
