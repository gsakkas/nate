
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
      let carry = match a with | (f,g::[]) -> f in
      let digit =
        match x with
        | (f,g) ->
            if ((f + g) + carry) > 9
            then (1, ((f + g) + (carry mod 10)))
            else (0, ((f + g) + (carry mod 10))) in
      digit in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> (f + g) + (carry mod 10) in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,18)-(16,47)
match a with
| (f , g) -> f
CaseG VarG (fromList [(Nothing,VarG)])

(17,6)-(23,11)
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Case (Just (16,18)-(16,43)) (Var (Just (16,24)-(16,25)) "a") [(TuplePat (Just (16,34)-(16,37)) [VarPat (Just (16,34)-(16,35)) "f",VarPat (Just (16,36)-(16,37)) "g"],Nothing,Var (Just (16,42)-(16,43)) "f")]
Let (Just (17,6)-(20,50)) NonRec [(VarPat (Just (17,10)-(17,14)) "newc",Case (Just (18,8)-(18,70)) (Var (Just (18,14)-(18,15)) "x") [(TuplePat (Just (18,24)-(18,27)) [VarPat (Just (18,24)-(18,25)) "f",VarPat (Just (18,26)-(18,27)) "g"],Nothing,Ite (Just (18,32)-(18,70)) (Bop (Just (18,35)-(18,56)) Gt (Bop (Just (18,35)-(18,52)) Plus (Bop (Just (18,36)-(18,43)) Plus (Var (Just (18,37)-(18,38)) "f") (Var (Just (18,41)-(18,42)) "g")) (Var (Just (18,46)-(18,51)) "carry")) (Lit (Just (18,55)-(18,56)) (LI 9))) (Lit (Just (18,62)-(18,63)) (LI 1)) (Lit (Just (18,69)-(18,70)) (LI 0)))])] (Let (Just (19,6)-(20,50)) NonRec [(VarPat (Just (19,10)-(19,15)) "digit",Case (Just (19,18)-(19,66)) (Var (Just (19,24)-(19,25)) "x") [(TuplePat (Just (19,34)-(19,37)) [VarPat (Just (19,34)-(19,35)) "f",VarPat (Just (19,36)-(19,37)) "g"],Nothing,Bop (Just (19,42)-(19,66)) Plus (Bop (Just (19,42)-(19,49)) Plus (Var (Just (19,43)-(19,44)) "f") (Var (Just (19,47)-(19,48)) "g")) (Bop (Just (19,52)-(19,66)) Mod (Var (Just (19,53)-(19,58)) "carry") (Lit (Just (19,63)-(19,65)) (LI 10))))])] (Case (Just (20,6)-(20,50)) (Var (Just (20,12)-(20,13)) "a") [(TuplePat (Just (20,22)-(20,25)) [VarPat (Just (20,22)-(20,23)) "o",VarPat (Just (20,24)-(20,25)) "p"],Nothing,Tuple (Just (20,30)-(20,50)) [Var (Just (20,31)-(20,35)) "newc",ConApp (Just (20,37)-(20,49)) "::" (Just (Tuple (Just (20,38)-(20,48)) [Var (Just (20,38)-(20,43)) "digit",Var (Just (20,47)-(20,48)) "p"])) Nothing])]))
*)

(* typed spans
(16,18)-(16,43)
(17,6)-(20,50)
*)

(* correct types
int
(int * int list)
*)

(* bad types
int
(int * int)
*)
