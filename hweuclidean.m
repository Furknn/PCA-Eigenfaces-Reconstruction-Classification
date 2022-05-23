function hweuclidean=hweuclidean(a,b)
% calculates euclidean distance between two vectors
hweuclidean=sqrt(sum((a - b) .^ 2));
end