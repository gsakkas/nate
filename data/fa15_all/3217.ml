
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     let (h2::[])::t2 = t in
     match t with
     | [] -> [h]
     | _ -> [(h * i) / 10] @ [(mulByDigit i [h2 + (h mod 10)]) @ t2]);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(10,69)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(4,7)-(4,9)
EMPTY
EmptyG

(10,14)-(10,15)
x
VarG

(10,29)-(10,68)
[((x * i) mod 10) + x'] @ (mulByDigit i
                                      [x'] @ x'')
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(10,30)-(10,67)
((x * i) mod 10) + x'
BopG (BopG EmptyG EmptyG) VarG

(10,45)-(10,60)
x'
VarG

*)

(* typed spans
(3,2)-(7,63)
(6,8)-(6,9)
(7,8)-(7,63)
(7,10)-(7,31)
(7,51)-(7,53)
*)

(* typed spans
int list
int
int list
int
int
*)

(* typed spans
int list
int
int list list list
int list list
int
*)
