function out=evl(data,labels,algorithm)
    orgndata=data;
    orglabel=labels;
    ten=fix(size(data,1)/10);
    for i=1:10
        data=orgndata;
        label=orglabel;
        test=data((i-1)*ten+1:i*ten,:);
        l_test=label((i-1)*ten+1:i*ten,:);
        data((i-1)*ten+1:i*ten,:)=[];
        label((i-1)*ten+1:i*ten,:)=[];
        traindata=data;
        trainlabel=label;
        switch algorithm
            case 'NB'
                Class = NB(traindata,trainlabel,test);
            case 'KNN'
                Class= KNN(traindata,trainlabel,test);
            case 'DT'
                Class= DT(traindata,trainlabel,test);
            case 'MSVM'
                Class=MSVM(traindata,trainlabel,test);
            case 'Boost'
                Class=boosting_ens(traindata,trainlabel,test);
            case 'RAND'
                Class=subspace_ens(traindata,trainlabel,test);
        end

        [accuracy(i),precision(i),recall(i)]= evaluation(Class,l_test);
    end
    ac=mean(accuracy)*100;
    prec=mean(precision)*100;
    rec=mean(recall)*100;
    out=[ac,prec,rec,];
end