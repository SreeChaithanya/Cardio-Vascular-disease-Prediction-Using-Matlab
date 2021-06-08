function class=subspace_ens(train,l_train,test)
    
    bag_tree=fitensemble(train,l_train,'Subspace',50,'KNN','type','classification');
    class=predict(bag_tree,test);
    
end