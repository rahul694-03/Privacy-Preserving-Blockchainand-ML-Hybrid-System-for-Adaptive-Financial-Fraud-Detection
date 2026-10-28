pragma solidity >= 0.8.11 <= 0.8.11;
pragma experimental ABIEncoderV2;
//Federated Learning solidity code
contract MLContract {

    uint public modelCount = 0; 
    mapping(uint => model) public modelList; 
     struct model
     {
       string model_name;
       string model_weight;
       string model_intercept;
       string model_classes;
     }
 
   // events to registerModel
   event registerModel(uint indexed _modelId);

  
   //function  to submit model updates
   function saveBestModel(string memory mname, string memory mweight, string memory mi, string memory mc) public {
      modelList[modelCount] = model(mname, mweight, mi, mc);
      emit registerModel(modelCount);
      modelCount++;
    }

    function updateWeight(uint i, string memory weight) public {
       modelList[i].model_weight= weight;
    }

    function updateHashcode(uint i, string memory mi) public {
       modelList[i].model_intercept = mi;
    }

    function updateDate(uint i, string memory mc) public { 
      modelList[i].model_classes = mc;
   }

     //get number of local client model count
    function getModelCount()  public view returns (uint) {
          return  modelCount;
    }

    function getModelName(uint i) public view returns (string memory) {
        model memory aggregate = modelList[i];
	return aggregate.model_name;
    }

    function getWeight(uint i) public view returns (string memory) {
        model memory aggregate = modelList[i];
	return aggregate.model_weight;
    }

    function getIntercept(uint i) public view returns (string memory) {
        model memory aggregate = modelList[i];
	return aggregate.model_intercept;
    }

   function getClasses(uint i) public view returns (string memory) {
        model memory aggregate = modelList[i];
	return aggregate.model_classes;
    }	   
    
}