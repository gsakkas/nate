CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])
match l with
| [] -> []
| _ :: tl -> listReverse tl
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
match n with
| 0 -> [0]
| _ -> loop n []
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
match n with
| 0 -> []
| _ -> myAppend (getDigits (n / 10))
                (n mod 10)
match n with
| 0 -> []
| _ -> clone x (n - 1) @ [x]
match l with
| [] -> []
| _ :: tl -> listReverse tl
