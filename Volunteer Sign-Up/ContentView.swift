//
//  ContentView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            /*NavigationLink(destination: CreateAccountIView())
            {
                Text("Click Here To See My Page!")
                
            }*/
            
            HomePageView()
            
        }
        //.navigationBarBackButtonHidden(true)
        
    }
    
}

struct HomePageView: View {
    
    var body: some View {
        
        NavigationLink(destination: CreateAccountIView())
        {
            Text("* HomePage goes here *")
        }
        
    }
    
}

struct VolunteerMenuView: View {
    
    var body: some View {
        
        Text("* VolunteerMenu goes here *")
        
        //.navigationBarBackButtonHidden(true)
        
    }
    
    
}

/*
// This is the latest working version of CreateAccount!
// TODO: Figure out if "Create Account" can be created slightly bigger
// TODO: Setup the capability to go back to HomePage (This may not be something I have to do, but rather something Nathan has to do when he creates the HomePage)
// TODO: (The hard part) Find a way to store the Form information in a database
// TODO: Tie this page to Nathan's page (VolunteerMenu) when he finishes it
struct CreateAccountCopy: View {
    
    // There are the variables I use in the form
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView {
        
            VStack {
            
                //HStack {
                    
                //}
                //.padding()
                
                Divider()
                
                // I debated whether or not to incorporate Form() either instead of or along with VStack, but this didn't work since the "Username" and "Password" text above the text entry fields would appear with a border
                
                Form {
                    
                    Section(header: Text("Full Name")) {
                        
                        TextField("Full Name", text: $name, prompt: Text("Enter your name"))
                        
                    }
                    
                    Section(header: Text("Email")) {
                        
                        TextField("Email", text: $email, prompt: Text("Enter your email"))
                        
                    }
                    
                    Section(header: Text("Phone")) {
                        
                        TextField("Phone", text: $phone, prompt: Text("Enter your phone number"))
                        
                    }
                    
                    Section(header: Text("Username")) {
                        
                        TextField("Username", text: $username, prompt: Text("Enter a username"))
                        
                    }
                    
                    Section(header: Text("Password")) {
                        
                        SecureField("Password", text: $password, prompt: Text("Enter a password"))
                        
                    }
                    
                    // Note: ContentView() MUST be changed to the name of the struct Nathan creates to implement VolunteerMenu()
                    // Note: There's also an onSubmit() function that may be something to consider replacing this with if it doesn't integrate into the project accordingly
                    NavigationLink(destination: ContentView()) {
                        
                        Text("Create Account")
                        
                    }
                    
                    
                    // Note: The main thing that made this button align correctly is the fact that maxWidth was set to .infinity
                    //Button("Create Account", action: {})
                        //.frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                // The following code that's commented out is an inferior way to output the text without a Form
                
                /*VStack(alignment: .leading) {
                        
                    Text("Username")
                    
                    // Note: RoundedBorderTextFieldStyle() is used because by default the text field doesn't have borders
                    TextField("Username", text: $username, prompt: Text("Enter a username"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Note: The padding on the line below only pads the left, top and right respectively for the given VStack
                }.padding([.leading, .top, .trailing])
                
                VStack(alignment: .leading) {
                    
                    Text("Password")
                    
                    SecureField("Password", text: $password, prompt: Text("Create a passowrd"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }.padding()*/
                
                //Spacer()
            }
            .navigationBarTitle("Create Account", displayMode: .inline)
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

// This is outdated! Use CreateAccountCopy instead!
struct CreateAccount: View {
    
    // There are the variables I use in the form
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        
            HStack {
        
                Text("Create Account")
                    .font(.largeTitle)
                    //.padding()
                
            }
            //.padding()
            
            Divider()
            
            // I debated whether or not to incorporate Form() either instead of or along with VStack, but this didn't work since the "Username" and "Password" text above the text entry fields would appear with a border
            
            Form {
                
                Section(header: Text("Full Name")) {
                    
                    TextField("Full Name", text: $name, prompt: Text("Enter your name"))
                    
                }
                
                Section(header: Text("Email")) {
                    
                    TextField("Email", text: $email, prompt: Text("Enter your email"))
                    
                }
                
                Section(header: Text("Phone")) {
                    
                    TextField("Phone", text: $phone, prompt: Text("Enter your phone number"))
                    
                }
                
                Section(header: Text("Username")) {
                    
                    TextField("Username", text: $username, prompt: Text("Enter a username"))
                    
                }
                
                Section(header: Text("Password")) {
                    
                    SecureField("Password", text: $password, prompt: Text("Enter a password"))
                    
                }
                
                
                // Note: The main thing that made this button align correctly is the fact that maxWidth was set to .infinity
                Button("Create Account", action: {})
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
            
            // The following code that's commented out is an inferior way to output the text without a form
            /*VStack(alignment: .leading) {
                    
                Text("Username")
                
                // Note: RoundedBorderTextFieldStyle() is used because by default the text field doesn't have borders
                TextField("Username", text: $username, prompt: Text("Enter a username"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Note: The padding on the line below only pads the left, top and right respectively for the given VStack
            }.padding([.leading, .top, .trailing])
            
            VStack(alignment: .leading) {
                
                Text("Password")
                
                SecureField("Password", text: $password, prompt: Text("Create a passowrd"))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }.padding()*/
            
            Spacer()
        }
        
    }
    
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            //CreateAccount()
            //CreateAccountCopy()
        }
    }
}
