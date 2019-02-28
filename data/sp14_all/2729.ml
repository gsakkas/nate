
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
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) a)) in
  let base = ([], 0) in
  let args = l1 in let res = List.fold_left f base args in res;;


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
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(47,72)-(47,73)
c
VarG

(48,18)-(48,19)
[0]
ListG LitG

(49,19)-(49,62)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Var (Just (47,72)-(47,73)) "c"
List (Just (48,18)-(48,21)) [Lit (Just (48,19)-(48,20)) (LI 0)] Nothing
Let (Just (49,19)-(49,66)) NonRec [(TuplePat (Just (49,24)-(49,29)) [WildPat (Just (49,24)-(49,25)),VarPat (Just (49,26)-(49,29)) "res"],App (Just (49,33)-(49,59)) (Var (Just (49,33)-(49,47)) "List.fold_left") [Var (Just (49,48)-(49,49)) "f",Var (Just (49,50)-(49,54)) "base",Var (Just (49,55)-(49,59)) "args"])] (Var (Just (49,63)-(49,66)) "res")
*)

(* typed spans
(47,72)-(47,73)
(48,18)-(48,21)
(49,19)-(49,66)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int list
int
'a
*)
