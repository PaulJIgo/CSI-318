//
//  ContactsViewModel.swift
//  TableViews
//
//  Created by Paul Igo on 2/16/26.
//

struct Contact {
    var name: String
    var email: String
    var phoneNumber: String
}



class ContactsViewModel {
    
    var objects: [Contact] = []
    
    init(objects: [Contact]) {
        self.objects = objects
    }

    // We can create an init to make sure our createContact is right away
    init() {
        objects = createContact()
    }
    
    // We created a function to add a blank contact
    func addBlankContact() {
        objects.append(Contact(name: "Blank", email: "Blank@Blank.com", phoneNumber: "Blank"))
    }
    
    // Create default data for our application 
    func createContact() -> [Contact] {
        return [
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
            Contact(name: "Marina", email: "Marina@hotmail.edu", phoneNumber: "123-312-1243"),
            Contact(name: "Connor", email: "connor@champlain.edu", phoneNumber: "213124123123"),
            Contact(name: "Front Row Brendn", email: "Brendn@gmail.com", phoneNumber: "1234-=123"),
            Contact(name: "Adrian", email: "Adrian@Adrian.com", phoneNumber: "1234-=1sasdfsadf23"),
            Contact(name: "Corinne", email: "Corrinne@MEZ.com", phoneNumber: "1234-=1saasdf~~~~sdfsadf23"),
        ]
    }
}
