
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (x,y) -> x in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let t x = x + 1;;

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
(16,16)-(16,41)
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

*)

(* changed exprs
Let (Just (17,6)-(22,61)) NonRec [(VarPat (Just (17,10)-(17,15)) "carry",Case (Just (17,18)-(17,43)) (Var (Just (17,24)-(17,25)) "a") [(TuplePat (Just (17,34)-(17,37)) [VarPat (Just (17,34)-(17,35)) "x",VarPat (Just (17,36)-(17,37)) "y"],Nothing,Var (Just (17,42)-(17,43)) "x")])] (Case (Just (18,6)-(22,61)) (Var (Just (18,12)-(18,13)) "x") [(TuplePat (Just (19,9)-(19,26)) [VarPat (Just (19,9)-(19,17)) "addend_a",VarPat (Just (19,18)-(19,26)) "addend_b"],Nothing,Let (Just (20,10)-(22,61)) NonRec [(VarPat (Just (20,14)-(20,23)) "new_carry",Bop (Just (20,26)-(20,62)) Div (Bop (Just (20,26)-(20,57)) Plus (Bop (Just (20,27)-(20,45)) Plus (Var (Just (20,28)-(20,33)) "carry") (Var (Just (20,36)-(20,44)) "addend_a")) (Var (Just (20,48)-(20,56)) "addend_b")) (Lit (Just (20,60)-(20,62)) (LI 10)))] (Let (Just (21,10)-(22,61)) NonRec [(VarPat (Just (21,14)-(21,19)) "digit",Bop (Just (21,22)-(21,60)) Mod (Bop (Just (21,22)-(21,53)) Plus (Bop (Just (21,23)-(21,41)) Plus (Var (Just (21,24)-(21,29)) "carry") (Var (Just (21,32)-(21,40)) "addend_a")) (Var (Just (21,44)-(21,52)) "addend_b")) (Lit (Just (21,58)-(21,60)) (LI 10)))] (Case (Just (22,10)-(22,61)) (Var (Just (22,17)-(22,18)) "a") [(TuplePat (Just (22,27)-(22,30)) [VarPat (Just (22,27)-(22,28)) "x",VarPat (Just (22,29)-(22,30)) "y"],Nothing,Tuple (Just (22,35)-(22,60)) [Var (Just (22,36)-(22,45)) "new_carry",ConApp (Just (22,47)-(22,59)) "::" (Just (Tuple (Just (22,48)-(22,58)) [Var (Just (22,48)-(22,53)) "digit",Var (Just (22,57)-(22,58)) "y"])) Nothing])])))])
*)

(* typed spans
(17,6)-(22,61)
*)

(* correct types
(int * int list)
*)

(* bad types
'a
*)
