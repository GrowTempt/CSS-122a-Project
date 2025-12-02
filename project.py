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

    elif function == "deleteBaseModel":
        db_functions.deleteBaseModel(*args)

    elif function == "listInternetService":
        db_functions.listInternetService(*args)


if __name__ == "__main__":
    main()
