
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
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = bigAdd a x in
  let base = [] in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


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
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = match a with | (_,y) -> (0, (bigAdd y x)) in
  let base = (0, []) in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,14)-(31,24)
match a with
| (_ , y) -> (0 , bigAdd y x)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(32,13)-(32,15)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Case (Just (31,14)-(31,55)) (Var (Just (31,20)-(31,21)) "a") [(TuplePat (Just (31,30)-(31,33)) [WildPat (Just (31,30)-(31,31)),VarPat (Just (31,32)-(31,33)) "y"],Nothing,Tuple (Just (31,38)-(31,55)) [Lit (Just (31,39)-(31,40)) (LI 0),App (Just (31,42)-(31,54)) (Var (Just (31,43)-(31,49)) "bigAdd") [Var (Just (31,50)-(31,51)) "y",Var (Just (31,52)-(31,53)) "x"]])]
Tuple (Just (32,13)-(32,20)) [Lit (Just (32,14)-(32,15)) (LI 0),List (Just (32,17)-(32,19)) [] Nothing]
*)

(* typed spans
(31,14)-(31,55)
(32,13)-(32,20)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
int list
int list
*)
