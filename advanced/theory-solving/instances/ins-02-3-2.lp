job(1..3). machine(1..2).
duration(1,1,8).
duration(1,2,2).
duration(2,1,7).
duration(2,2,6).
duration(3,1,7).
duration(3,2,6).
sequence(1,1,2).
sequence(1,2,1).
sequence(2,1,1).
sequence(2,2,2).
sequence(3,1,2).
sequence(3,2,1).






%Answer: 1
%permutation(2,3) permutation(3,1) dl((1,1),14) dl(bound,24) dl((1,2),22) dl((2,1),0) dl((2,2),7) dl((3,1),7) dl((3,2),14)
%Answer: 2
%permutation(2,1) permutation(3,2) dl((1,1),14) dl(bound,24) dl((1,2),22) dl((2,1),7) dl((2,2),14) dl((3,1),0) dl((3,2),7)
