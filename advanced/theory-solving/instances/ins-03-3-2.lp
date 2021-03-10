job(1..3). machine(1..2).
duration(1,1,5).
duration(1,2,5).
duration(2,1,3).
duration(2,2,8).
duration(3,1,6).
duration(3,2,6).
sequence(1,1,1).
sequence(1,2,2).
sequence(2,1,2).
sequence(2,2,1).
sequence(3,1,1).
sequence(3,2,2).






%Answer: 1
%permutation(2,3) permutation(3,1) dl((1,1),9) dl(bound,22) dl((1,2),17) dl((2,1),0) dl((2,2),3) dl((3,1),3) dl((3,2),11)
%Answer: 2
%permutation(2,1) permutation(1,3) dl((1,1),3) dl(bound,22) dl((1,2),11) dl((2,1),0) dl((2,2),3) dl((3,1),8) dl((3,2),16)
