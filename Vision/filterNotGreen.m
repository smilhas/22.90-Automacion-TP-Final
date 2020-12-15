function [fdots] = filterNotGreen(image,dots)
%@dots: arreglo de puntos detectados
%@image: imagen original en color
%@return: devuelve un nuevo arreglo con los dots filtrados 
fdots=[];
dsize=length(dots);
for i=1:dsize
    if(isGreen(image(dots(i).v,dots(i).u,:))==1)
        fdots=[fdots dots(i)];
    end
end

end

