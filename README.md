# iOS_Swift_MVVM
iOS | Swift | MVVM Architecture | Unit tests | UI tests | clean, readable and well-structured code | UI/UX principles

# MVVM in iOS | Swift

<img src="https://raw.githubusercontent.com/Sankra/NotifyPropertyChanged.Verifier/7c17c21f24fa1cea007070a575576c99faa5302b/doc/mvvm.svg" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="240" height="356">

`John Gossman`, an architect from Microsoft is credited to have created the `Model View-View Model` 
pattern in the year 2005. There are three main components of this model:

* **Model** is all about implementing the domain model of the application to include the data model, validation, and business logic. 
Instances of the Model objects are DTOs (data transfer objects), business objects, POCOs (Plain Old CLR Objects), 
proxy objects, generated entity, and repositories.

* **View** is all that the user can see, like the structure, the layout, and how everything comes up on screen. It is the app page within the application. 
**View** receives and sends out updates to only the **View-Model**, except the communications that take place between the Model and this part.

* **View-Model** is the chain between the **Model** and the **View** components. The logic behind **View** is handled by this component. 
The model classes are used by the **View-Model** to interact with Model. The **View-Model** then takes the **Model** data in the form that **View** can put to use.

## Links

* [WikipediA](https://en.wikipedia.org/wiki/Model–view–viewmodel)
* [MEDIUM - MVVM in iOS Swift](https://medium.com/flawless-app-stories/mvvm-in-ios-swift-aa1448a66fb4)
