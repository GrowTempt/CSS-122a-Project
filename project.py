import db_functions
import sys

def main():
    if len(sys.argv) < 2:
        return

    function = sys.argv[1]
    args = sys.argv[2:]
    
    if function == "import":
        db_functions.import_data(*args)

    elif function == "insertAgentClient":
        db_functions.insertAgentClient(*args)

    elif function == "addCustomizedModel":
        db_functions.addCustomizedModel(*args)

    elif function == "deleteBaseModel":
        db_functions.deleteBaseModel(*args)

    elif function == "listInternetService":
        db_functions.listInternetService(*args)

    elif function == "countCustomizedModel":
        db_functions.countCustomizedModel(*args)
    
    elif function == "topNDurationConfig":
        db_functions.topNDurationConfig(*args)

    elif function == "listBaseModelKeyWord":
        db_functions.keywordSearch(*args)

    elif function == "printN2LSQLresult":
        db_functions.printNL2SQLresult(*args)

if __name__ == "__main__":
    main()
