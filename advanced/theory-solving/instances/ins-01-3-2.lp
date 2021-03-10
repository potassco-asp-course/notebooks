job(1..3). machine(1..2).
duration(1,1,3).
duration(1,2,4).
duration(2,1,1).
duration(2,2,6).
duration(3,1,5).
duration(3,2,5).
sequence(1,1,1).
sequence(1,2,2).
sequence(2,1,1).
sequence(2,2,2).
sequence(3,1,1).
sequence(3,2,2).






%Answer: 1
%permutation(2,3) permutation(3,1) dl((1,1),6) dl(bound,16) dl((1,2),12) dl((2,1),0) dl((2,2),1) dl((3,1),1) dl((3,2),7)
%Answer: 2
%permutation(2,1) permutation(1,3) dl((1,1),1) dl(bound,16) dl((1,2),7) dl((2,1),0) dl((2,2),1) dl((3,1),4) dl((3,2),11)
