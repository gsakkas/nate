
Goal: given a sample program, remove section using csv, fill with converted ExprGeneric

Steps:
- Read sample programs (bad) from `~/git/nate/features/data/ucsd/data/derived/sp14/pairs.json`
- Read location and patch# from `~/git/nate/data/sp14_all/spans+trees+all/0000.csv`
- Hardcode ExprGeneric patches from `~/git/nate/data/sp14_all/clusters/top_clusters.txt`
- Using location and patch, add replacement in bad program

File reference:
`good and bad pairs`: ~/git/nate/features/data/ucsd/data/derived/sp14/pairs.json
`cluster 40 lines`: ~/git/nate/data/sp14_all/clusters/top_clusters.txt
`types`: ~/git/nate/features/src/NanoML/Types.hs
`diffs to ExprGeneric`: ~/git/nate/features/src/NanoML/Classify.hs:1459
`sample program`: ~/git/nate/data/sp14_all/0000.ml
`find clusters`: ~/git/nate/features/bin/Generate.hs:173
`exprgeneric per program`: ~/git/nate/data/sp14_all/clusters/0001.ml
`csv per program`: ~/git/nate/data/sp14_all/spans+trees+all/0000.csv
