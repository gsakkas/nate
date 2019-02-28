
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
      | _ -> [carry / 10; carry mod 10] in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

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
(15,18)-(15,35)
match a with
| (x , y) -> x
CaseG VarG (fromList [(Nothing,VarG)])

(15,33)-(15,34)
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(16,6)-(18,39)
let new_carry =
  ((carry + addend_a) + addend_b) / 10 in
let digit =
  ((carry + addend_a) + addend_b) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Case (Just (15,18)-(15,43)) (Var (Just (15,24)-(15,25)) "a") [(TuplePat (Just (15,34)-(15,37)) [VarPat (Just (15,34)-(15,35)) "x",VarPat (Just (15,36)-(15,37)) "y"],Nothing,Var (Just (15,42)-(15,43)) "x")]
Case (Just (16,6)-(20,61)) (Var (Just (16,12)-(16,13)) "x") [(TuplePat (Just (17,9)-(17,26)) [VarPat (Just (17,9)-(17,17)) "addend_a",VarPat (Just (17,18)-(17,26)) "addend_b"],Nothing,Let (Just (18,10)-(20,61)) NonRec [(VarPat (Just (18,14)-(18,23)) "new_carry",Bop (Just (18,26)-(18,62)) Div (Bop (Just (18,26)-(18,57)) Plus (Bop (Just (18,27)-(18,45)) Plus (Var (Just (18,28)-(18,33)) "carry") (Var (Just (18,36)-(18,44)) "addend_a")) (Var (Just (18,48)-(18,56)) "addend_b")) (Lit (Just (18,60)-(18,62)) (LI 10)))] (Let (Just (19,10)-(20,61)) NonRec [(VarPat (Just (19,14)-(19,19)) "digit",Bop (Just (19,22)-(19,60)) Mod (Bop (Just (19,22)-(19,53)) Plus (Bop (Just (19,23)-(19,41)) Plus (Var (Just (19,24)-(19,29)) "carry") (Var (Just (19,32)-(19,40)) "addend_a")) (Var (Just (19,44)-(19,52)) "addend_b")) (Lit (Just (19,58)-(19,60)) (LI 10)))] (Case (Just (20,10)-(20,61)) (Var (Just (20,17)-(20,18)) "a") [(TuplePat (Just (20,27)-(20,30)) [VarPat (Just (20,27)-(20,28)) "x",VarPat (Just (20,29)-(20,30)) "y"],Nothing,Tuple (Just (20,35)-(20,60)) [Var (Just (20,36)-(20,45)) "new_carry",ConApp (Just (20,47)-(20,59)) "::" (Just (Tuple (Just (20,48)-(20,58)) [Var (Just (20,48)-(20,53)) "digit",Var (Just (20,57)-(20,58)) "y"])) Nothing])])))]
Let (Just (18,10)-(20,61)) NonRec [(VarPat (Just (18,14)-(18,23)) "new_carry",Bop (Just (18,26)-(18,62)) Div (Bop (Just (18,26)-(18,57)) Plus (Bop (Just (18,27)-(18,45)) Plus (Var (Just (18,28)-(18,33)) "carry") (Var (Just (18,36)-(18,44)) "addend_a")) (Var (Just (18,48)-(18,56)) "addend_b")) (Lit (Just (18,60)-(18,62)) (LI 10)))] (Let (Just (19,10)-(20,61)) NonRec [(VarPat (Just (19,14)-(19,19)) "digit",Bop (Just (19,22)-(19,60)) Mod (Bop (Just (19,22)-(19,53)) Plus (Bop (Just (19,23)-(19,41)) Plus (Var (Just (19,24)-(19,29)) "carry") (Var (Just (19,32)-(19,40)) "addend_a")) (Var (Just (19,44)-(19,52)) "addend_b")) (Lit (Just (19,58)-(19,60)) (LI 10)))] (Case (Just (20,10)-(20,61)) (Var (Just (20,17)-(20,18)) "a") [(TuplePat (Just (20,27)-(20,30)) [VarPat (Just (20,27)-(20,28)) "x",VarPat (Just (20,29)-(20,30)) "y"],Nothing,Tuple (Just (20,35)-(20,60)) [Var (Just (20,36)-(20,45)) "new_carry",ConApp (Just (20,47)-(20,59)) "::" (Just (Tuple (Just (20,48)-(20,58)) [Var (Just (20,48)-(20,53)) "digit",Var (Just (20,57)-(20,58)) "y"])) Nothing])]))
*)

(* typed spans
(15,18)-(15,43)
(16,6)-(20,61)
(18,10)-(20,61)
*)

(* correct types
int
(int * int list)
(int * int list)
*)

(* bad types
int
(int * int)
int list
*)
