# iOS_Swift_MVVM
iOS | Swift | MVVM Architecture | Unit tests | UI tests | clean, readable and well-structured code | UI/UX principles

# MVVM in iOS | Swift  [![Cult Of Martians][cult-img]][cult]

<img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2FSankra%2FNotifyPropertyChanged.Verifier&psig=AOvVaw10pEtawKH5cTjkY_e5PScv&ust=1637657354608000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCMDq55vLq_QCFQAAAAAdAAAAABAJ" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="120" height="178">

`John Gossman`, an architect from Microsoft is credited to have created the `Model View-View Model` 
pattern in the year 2005. There are three main components of this model:

* **Model** is all about implementing the domain model of the application to include the data model, validation, and business logic. 
Instances of the Model objects are DTOs (data transfer objects), business objects, POCOs (Plain Old CLR Objects), 
proxy objects, generated entity, and repositories.

* **View** is all that the user can see, like the structure, the layout, and how everything comes up on screen. It is the app page within the application. 
**View** receives and sends out updates to only the **View-Model**, except the communications that take place between the Model and this part.

* **View-Model** is the chain between the **Model** and the **View** components. The logic behind **View** is handled by this component. 
The model classes are used by the **View-Model** to interact with Model. The **View-Model** then takes the **Model** data in the form that **View** can put to use.
