
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x :: a in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,22)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(16,15)-(16,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(17,15)-(17,17)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(17,21)-(17,68)
l2
VarG

*)

(* changed exprs
Let (Just (16,6)-(21,61)) NonRec [(VarPat (Just (16,10)-(16,15)) "carry",Case (Just (16,18)-(16,43)) (Var (Just (16,24)-(16,25)) "a") [(TuplePat (Just (16,34)-(16,37)) [VarPat (Just (16,34)-(16,35)) "x",VarPat (Just (16,36)-(16,37)) "y"],Nothing,Var (Just (16,42)-(16,43)) "x")])] (Case (Just (17,6)-(21,61)) (Var (Just (17,12)-(17,13)) "x") [(TuplePat (Just (18,9)-(18,26)) [VarPat (Just (18,9)-(18,17)) "addend_a",VarPat (Just (18,18)-(18,26)) "addend_b"],Nothing,Let (Just (19,10)-(21,61)) NonRec [(VarPat (Just (19,14)-(19,23)) "new_carry",Bop (Just (19,26)-(19,62)) Div (Bop (Just (19,26)-(19,57)) Plus (Bop (Just (19,27)-(19,45)) Plus (Var (Just (19,28)-(19,33)) "carry") (Var (Just (19,36)-(19,44)) "addend_a")) (Var (Just (19,48)-(19,56)) "addend_b")) (Lit (Just (19,60)-(19,62)) (LI 10)))] (Let (Just (20,10)-(21,61)) NonRec [(VarPat (Just (20,14)-(20,19)) "digit",Bop (Just (20,22)-(20,60)) Mod (Bop (Just (20,22)-(20,53)) Plus (Bop (Just (20,23)-(20,41)) Plus (Var (Just (20,24)-(20,29)) "carry") (Var (Just (20,32)-(20,40)) "addend_a")) (Var (Just (20,44)-(20,52)) "addend_b")) (Lit (Just (20,58)-(20,60)) (LI 10)))] (Case (Just (21,10)-(21,61)) (Var (Just (21,17)-(21,18)) "a") [(TuplePat (Just (21,27)-(21,30)) [VarPat (Just (21,27)-(21,28)) "x",VarPat (Just (21,29)-(21,30)) "y"],Nothing,Tuple (Just (21,35)-(21,60)) [Var (Just (21,36)-(21,45)) "new_carry",ConApp (Just (21,47)-(21,59)) "::" (Just (Tuple (Just (21,48)-(21,58)) [Var (Just (21,48)-(21,53)) "digit",Var (Just (21,57)-(21,58)) "y"])) Nothing])])))])
Tuple (Just (22,15)-(22,22)) [Lit (Just (22,16)-(22,17)) (LI 0),List (Just (22,19)-(22,21)) [] Nothing]
App (Just (23,15)-(23,44)) (Var (Just (23,15)-(23,23)) "List.rev") [App (Just (23,24)-(23,44)) (Var (Just (23,25)-(23,37)) "List.combine") [Var (Just (23,38)-(23,40)) "l1",Var (Just (23,41)-(23,43)) "l2"]]
Var (Just (23,41)-(23,43)) "l2"
*)

(* typed spans
(16,6)-(21,61)
(22,15)-(22,22)
(23,15)-(23,44)
(23,41)-(23,43)
*)

(* correct types
(int * int list)
(int * int list)
(int * int) list
int list
*)

(* bad types
int list
int list
int list
int list
*)
