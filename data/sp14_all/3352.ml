
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x =
        match x with | [] -> [] | h::t -> [bigAdd h (adder t)] in
      adder
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
           [helper [] (h * i)]);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(38,42)-(38,62)
bigAdd h (adder t)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(39,6)-(41,31)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG (fromList [AppG (fromList [EmptyG])])

(39,6)-(41,31)
(@)
VarG

(39,6)-(41,31)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(39,6)-(41,31)
mulByDigit
VarG

(39,6)-(41,31)
i
VarG

(39,6)-(41,31)
List.rev (List.map (fun x ->
                      x * 10) t)
AppG (fromList [AppG (fromList [EmptyG])])

(39,6)-(41,31)
List.rev
VarG

(39,6)-(41,31)
List.map (fun x -> x * 10) t
AppG (fromList [VarG,LamG EmptyG])

(39,6)-(41,31)
List.map
VarG

(39,6)-(41,31)
fun x -> x * 10
LamG (BopG EmptyG EmptyG)

(39,6)-(41,31)
x * 10
BopG VarG LitG

(39,6)-(41,31)
x
VarG

(39,6)-(41,31)
10
LitG

(39,6)-(41,31)
t
VarG

(39,6)-(41,31)
helper [] (h * i) @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(39,6)-(41,31)
(@)
VarG

(41,12)-(41,18)
helper [] (h * i)
AppG (fromList [BopG EmptyG EmptyG,ListG EmptyG])

*)

(* changed exprs
App (Just (37,58)-(37,76)) (Var (Just (37,58)-(37,64)) "bigAdd") [Var (Just (37,65)-(37,66)) "h",App (Just (37,67)-(37,76)) (Var (Just (37,68)-(37,73)) "adder") [Var (Just (37,74)-(37,75)) "t"]]
App (Just (38,6)-(39,34)) (Var (Just (38,64)-(38,65)) "@") [App (Just (38,6)-(38,63)) (Var (Just (38,7)-(38,17)) "mulByDigit") [Var (Just (38,18)-(38,19)) "i",App (Just (38,20)-(38,62)) (Var (Just (38,21)-(38,29)) "List.rev") [App (Just (38,30)-(38,61)) (Var (Just (38,31)-(38,39)) "List.map") [Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing,Var (Just (38,59)-(38,60)) "t"]]],App (Just (39,8)-(39,34)) (Var (Just (39,29)-(39,30)) "@") [App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")],List (Just (39,31)-(39,33)) [] Nothing]]
Var (Just (38,64)-(38,65)) "@"
App (Just (38,6)-(38,63)) (Var (Just (38,7)-(38,17)) "mulByDigit") [Var (Just (38,18)-(38,19)) "i",App (Just (38,20)-(38,62)) (Var (Just (38,21)-(38,29)) "List.rev") [App (Just (38,30)-(38,61)) (Var (Just (38,31)-(38,39)) "List.map") [Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing,Var (Just (38,59)-(38,60)) "t"]]]
Var (Just (38,7)-(38,17)) "mulByDigit"
Var (Just (38,18)-(38,19)) "i"
App (Just (38,20)-(38,62)) (Var (Just (38,21)-(38,29)) "List.rev") [App (Just (38,30)-(38,61)) (Var (Just (38,31)-(38,39)) "List.map") [Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing,Var (Just (38,59)-(38,60)) "t"]]
Var (Just (38,21)-(38,29)) "List.rev"
App (Just (38,30)-(38,61)) (Var (Just (38,31)-(38,39)) "List.map") [Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing,Var (Just (38,59)-(38,60)) "t"]
Var (Just (38,31)-(38,39)) "List.map"
Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing
Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))
Var (Just (38,51)-(38,52)) "x"
Lit (Just (38,55)-(38,57)) (LI 10)
Var (Just (38,59)-(38,60)) "t"
App (Just (39,8)-(39,34)) (Var (Just (39,29)-(39,30)) "@") [App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")],List (Just (39,31)-(39,33)) [] Nothing]
Var (Just (39,29)-(39,30)) "@"
App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")]
*)

(* typed spans
(37,58)-(37,76)
(38,6)-(39,34)
(38,64)-(38,65)
(38,6)-(38,63)
(38,7)-(38,17)
(38,18)-(38,19)
(38,20)-(38,62)
(38,21)-(38,29)
(38,30)-(38,61)
(38,31)-(38,39)
(38,40)-(38,58)
(38,51)-(38,57)
(38,51)-(38,52)
(38,55)-(38,57)
(38,59)-(38,60)
(39,8)-(39,34)
(39,29)-(39,30)
(39,9)-(39,28)
*)

(* correct types
int list
int list
int list -> int list -> int list
int list
int -> int list -> int list
int
int list
int list -> int list
int list
(int -> int) -> int list -> int list
int -> int
int
int
int
int list
int list
int list -> int list -> int list
int list
*)

(* bad types
int list list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list
int list -> int -> int list
*)
